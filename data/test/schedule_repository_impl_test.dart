import 'dart:async';

import 'package:data/mapper/schedule_mapper.dart';
import 'package:data/modules/schedule/models/local/schedule_box.dart';
import 'package:data/modules/schedule/models/remote/index.dart';
import 'package:data/modules/schedule/schedule_repository_impl.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:test/test.dart';

void main() {
  group('ScheduleRepositoryImpl', () {
    late _FakeScheduleApiService api;
    late _MemoryScheduleLocalSource local;
    late ScheduleRepositoryImpl repository;

    setUp(() {
      api = _FakeScheduleApiService();
      local = _MemoryScheduleLocalSource();
      repository = ScheduleRepositoryImpl(apiService: api, localSource: local);
    });

    tearDown(() => repository.dispose());

    test('returns remote schedule and persists it', () async {
      api.responses['group-1'] = _scheduleDto('group-1', 'Remote');

      final result = await repository.getSchedule('group-1');

      expect(result.isRight(), isTrue);
      expect(result.getOrElse(_unreachable).group, 'Remote');
      expect(local.values['group-1']?.group, 'Remote');
      expect(local.writes, 1);
    });

    test('falls back to cached schedule when network is unavailable', () async {
      local.values['group-1'] = _scheduleEntity('group-1', 'Cached').toBox;
      api.errors['group-1'] = DioException.connectionError(
        requestOptions: RequestOptions(path: '/schedule/group-1'),
        reason: 'offline',
      );

      final result = await repository.getSchedule('group-1');

      expect(result.isRight(), isTrue);
      expect(result.getOrElse(_unreachable).group, 'Cached');
      expect(local.reads, 1);
    });

    test('does not hide authorization errors behind cached data', () async {
      local.values['group-1'] = _scheduleEntity('group-1', 'Cached').toBox;
      api.errors['group-1'] = DioException.badResponse(
        statusCode: 401,
        requestOptions: RequestOptions(path: '/schedule/group-1'),
        response: Response<void>(
          requestOptions: RequestOptions(path: '/schedule/group-1'),
          statusCode: 401,
        ),
      );

      final result = await repository.getSchedule('group-1');

      expect(result.isLeft(), isTrue);
      expect(local.reads, 0);
    });

    test('deduplicates concurrent requests for the same group', () async {
      final response = Completer<ScheduleApiDto>();
      api.pending['group-1'] = response;

      final first = repository.getSchedule('group-1');
      final second = repository.getSchedule('group-1');
      response.complete(_scheduleDto('group-1', 'Remote'));

      final results = await Future.wait([first, second]);
      expect(results.every((result) => result.isRight()), isTrue);
      expect(api.reads['group-1'], 1);
    });

    test(
      'maps domain schedules to local models when explicitly saved',
      () async {
        await repository.setSchedule(_scheduleEntity('group-1', 'Saved'));

        expect(local.values['group-1']?.group, 'Saved');
        expect(local.writes, 1);
      },
    );
  });
}

ScheduleEntity _unreachable() => throw StateError('Expected Right result.');

ScheduleEntity _scheduleEntity(String groupId, String group) =>
    _scheduleDto(groupId, group).toEntity;

ScheduleApiDto _scheduleDto(String groupId, String group) => ScheduleApiDto(
  group: group,
  groupId: groupId,
  monday: const [],
  tuesday: const [],
  wednesday: const [],
  thursday: const [],
  friday: const [],
);

class _FakeScheduleApiService implements ScheduleApiService {
  final responses = <String, ScheduleApiDto>{};
  final errors = <String, Object>{};
  final pending = <String, Completer<ScheduleApiDto>>{};
  final reads = <String, int>{};

  @override
  Future<ScheduleApiDto> getSchedule(String groupId) async {
    reads[groupId] = (reads[groupId] ?? 0) + 1;
    if (errors[groupId] case final error?) throw error;
    if (pending[groupId] case final completer?) return completer.future;
    return responses[groupId]!;
  }

  @override
  Future<ScheduleApiDto> addSchedule(
    String groupId,
    MultipartFile? file,
  ) async => responses[groupId]!;
}

class _MemoryScheduleLocalSource implements ScheduleLocalSource {
  final values = <String, ScheduleBox>{};
  int reads = 0;
  int writes = 0;

  @override
  Future<ScheduleBox> getScheduleFromCache(String groupId) async {
    reads++;
    final value = values[groupId];
    if (value == null) throw StateError('No cached schedule for $groupId');
    return value;
  }

  @override
  Future<void> setSchedule(ScheduleBox schedule) async {
    writes++;
    values[schedule.groupId] = schedule;
  }
}
