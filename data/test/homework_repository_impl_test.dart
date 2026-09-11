import 'dart:io';

import 'package:common/constants/post_classes.dart';
import 'package:data/modules/homework/homework_repository_impl.dart';
import 'package:data/modules/homework/models/local/homework_box.dart';
import 'package:data/modules/homework/models/remote/index.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:dio/dio.dart';
import 'package:data/mapper/homework_mapper.dart';
import 'package:domain/modules/homework/models/index.dart';
import 'package:test/test.dart';

void main() {
  late _FakeHomeworkApiService api;
  late _MemoryHomeworkLocalSource local;
  late HomeworkRepositoryImpl repository;

  setUp(() {
    api = _FakeHomeworkApiService();
    local = _MemoryHomeworkLocalSource();
    repository = HomeworkRepositoryImpl(remote: api, cache: local);
  });

  tearDown(() => repository.dispose());

  test('edit expands all request fields and maps the updated entity', () async {
    const request = EditHomeworkRequest(
      homeworkId: 'homework-1',
      subject: 'Physics',
      description: 'Updated',
      dueDate: '2026-10-01',
    );
    final result = await repository.editHomework(request);
    final entity = result.getOrElse(_unreachable);
    expect(api.editedId, request.homeworkId);
    expect(api.subject, request.subject);
    expect(api.description, request.description);
    expect(api.dueDate, request.dueDate);
    expect(entity.subject, 'Physics');
    expect(entity.description, 'Updated');
  });

  test('get by id, complete, and reopen map completion state', () async {
    expect(
      (await repository.getHomework(
        'homework-1',
      )).getOrElse(_unreachable).isDone,
      isFalse,
    );
    final done = (await repository.markHomeworkDone(
      'homework-1',
    )).getOrElse(_unreachable);
    expect(done.isDone, isTrue);
    expect(done.toBox.toEntity.isDone, isTrue);
    expect(
      (await repository.reopenHomework(
        'homework-1',
      )).getOrElse(_unreachable).isDone,
      isFalse,
    );
    expect(api.lastId, 'homework-1');
  });

  test('delete returns success without collapsing concurrent writes', () async {
    final results = await Future.wait([
      repository.deleteHomework('homework-1'),
      repository.deleteHomework('homework-1'),
    ]);
    expect(results.every((result) => result.isRight()), isTrue);
    expect(api.deletes, 2);
    expect(api.lastId, 'homework-1');
    expect(
      local.saved,
      isNull,
      reason: 'Remote-only recipes do not silently mutate cache',
    );
  });

  test('all new mutation failures use the shared failure mapper', () async {
    api.error = DioException.connectionError(
      requestOptions: RequestOptions(path: '/mock'),
      reason: 'offline',
    );
    final results = [
      await repository.editHomework(
        const EditHomeworkRequest(
          homeworkId: '1',
          subject: 'Math',
          description: 'Test',
          dueDate: '2026-10-01',
        ),
      ),
      await repository.markHomeworkDone('1'),
      await repository.reopenHomework('1'),
    ];
    for (final result in results) {
      expect(
        result.fold((failure) => failure.type, (_) => null),
        'dio_connectionError',
      );
    }
    expect(
      (await repository.deleteHomework(
        '1',
      )).fold((failure) => failure.type, (_) => null),
      'dio_connectionError',
    );
  });

  test('legacy API responses default completion to false', () {
    expect(
      HomeworkApiDto.fromJson({
        'id': '1',
        'subject': 'Math',
        'description': 'Test',
      }).isDone,
      isFalse,
    );
  });

  test('placeholder HTTP routes serialize without network calls', () async {
    final requests = <RequestOptions>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://homework.invalid'));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          requests.add(options);
          handler.resolve(
            Response(
              requestOptions: options,
              statusCode: options.method == 'DELETE' ? 204 : 200,
              data: options.method == 'DELETE'
                  ? null
                  : {
                      'id': 'homework-1',
                      'subject': 'Math',
                      'description': 'Test',
                      'isDone': options.path.endsWith('/complete'),
                    },
            ),
          );
        },
      ),
    );
    final service = HomeworkApiService(dio);
    await service.getHomework('homework-1');
    await service.editHomework(
      homeworkId: 'homework-1',
      subject: 'Physics',
      description: 'Updated',
      dueDate: '2026-10-01',
    );
    expect((await service.markHomeworkDone('homework-1')).isDone, isTrue);
    expect((await service.reopenHomework('homework-1')).isDone, isFalse);
    await service.deleteHomework('homework-1');
    expect(requests.map((r) => '${r.method} ${r.path}'), [
      'GET /api/Homework/homework-1',
      'PUT /api/Homework/homework-1',
      'POST /api/Homework/homework-1/complete',
      'POST /api/Homework/homework-1/reopen',
      'DELETE /api/Homework/homework-1',
    ]);
    expect(Map.fromEntries((requests[1].data as FormData).fields), {
      'subject': 'Physics',
      'description': 'Updated',
      'dueDate': '2026-10-01',
    });
    dio.close();
  });

  test('add projects request fields and maps response', () async {
    final request = CreateHomeworkRequest(
      groupId: 'group-a',
      subject: 'Math',
      description: 'Exercises',
      dueDate: '2026-08-18T12:00:00Z',
    );

    final result = await repository.addHomework(request);

    expect(result.isRight(), isTrue);
    expect(result.getOrElse(_unreachable).homeworkId, 'homework-1');
    expect(api.groupId, 'group-a');
    expect(api.subject, 'Math');
    expect(api.description, 'Exercises');
    expect(api.dueDate, '2026-08-18');
    expect(api.imageFile, isNull);
  });

  test('get maps DTO list and Dio failures', () async {
    final success = await repository.getHomeworks('group-a');
    expect(success.isRight(), isTrue);
    expect(success.getOrElse(() => const []).single.subject, 'Math');

    api.error = DioException.connectionError(
      requestOptions: RequestOptions(path: '/api/Homework/group/group-a'),
      reason: 'offline',
    );
    final failure = await repository.getHomeworks('group-a');
    expect(failure.isLeft(), isTrue);
    expect(
      failure.fold((value) => value.type, (_) => null),
      'dio_connectionError',
    );
  });

  test('cache stream maps boxes and setter delegates', () async {
    final cached = await repository.getHomeworksFromCache().first;
    expect(cached.single.homeworkId, 'cached-1');

    final values = [
      const HomeworkEntity(
        homeworkId: 'saved-1',
        subject: 'Physics',
        description: 'Read chapter',
      ),
    ];
    await repository.setHomework(values);
    expect(local.saved, same(values));
  });
}

HomeworkEntity _unreachable() => throw StateError('Expected Right result.');

const _dto = HomeworkApiDto(
  homeworkId: 'homework-1',
  subject: 'Math',
  description: 'Exercises',
);

final class _FakeHomeworkApiService implements HomeworkApiService {
  String? groupId;
  String? subject;
  String? description;
  String? dueDate;
  File? imageFile;
  Object? error;
  String? editedId;
  String? lastId;
  int deletes = 0;

  @override
  Future<HomeworkApiDto> getHomework(String homeworkId) async {
    lastId = homeworkId;
    if (error case final value?) throw value;
    return _dto;
  }

  @override
  Future<HomeworkApiDto> editHomework({
    required String homeworkId,
    required String subject,
    required String description,
    required String dueDate,
  }) async {
    editedId = homeworkId;
    this.subject = subject;
    this.description = description;
    this.dueDate = dueDate;
    if (error case final value?) throw value;
    return _dto.copyWith(
      subject: subject,
      description: description,
      dueDate: DateTime.parse(dueDate),
    );
  }

  @override
  Future<void> deleteHomework(String homeworkId) async {
    lastId = homeworkId;
    deletes++;
    await Future<void>.delayed(Duration.zero);
    if (error case final value?) throw value;
  }

  @override
  Future<HomeworkApiDto> markHomeworkDone(String homeworkId) async =>
      (await getHomework(homeworkId)).copyWith(isDone: true);

  @override
  Future<HomeworkApiDto> reopenHomework(String homeworkId) async =>
      (await getHomework(homeworkId)).copyWith(isDone: false);

  @override
  Future<HomeworkApiDto> addHomework({
    required String groupId,
    required String subject,
    required String description,
    required String dueDate,
    File? imageFile,
  }) async {
    this.groupId = groupId;
    this.subject = subject;
    this.description = description;
    this.dueDate = dueDate;
    this.imageFile = imageFile;
    if (error case final value?) throw value;
    return _dto;
  }

  @override
  Future<List<HomeworkApiDto>> getHomeworks(String groupId) async {
    if (error case final value?) throw value;
    return const [_dto];
  }
}

final class _MemoryHomeworkLocalSource implements HomeworkLocalSource {
  List<HomeworkEntity>? saved;

  @override
  Stream<List<HomeworkBox>> getHomeworkFromCache() => Stream.value([
    HomeworkBox(
      homeworkId: 'cached-1',
      subject: 'Cached',
      description: 'Cached description',
    ),
  ]);

  @override
  Future<void> setHomework(List<HomeworkEntity> homeworks) async {
    saved = homeworks;
  }
}
