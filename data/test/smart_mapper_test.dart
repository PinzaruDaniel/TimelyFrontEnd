import 'package:data/mapper/auth_tokens_mapper.dart';
import 'package:data/mapper/homework_mapper.dart';
import 'package:data/mapper/schedule_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/auth/models/remote/index.dart';
import 'package:data/modules/homework/models/local/homework_box.dart';
import 'package:data/modules/homework/models/remote/index.dart';
import 'package:data/modules/schedule/models/remote/index.dart';
import 'package:data/modules/user/models/remote/index.dart';
import 'package:test/test.dart';

void main() {
  test('maps auth tokens from Remote DTO to Domain Entity', () {
    final mapper = createAuthTokensMapper();
    final entity = mapper.fromRemote(
      const AuthTokensApiDto(accessToken: 'access', refreshToken: 'refresh'),
    );

    expect(entity.accessToken, 'access');
    expect(entity.refreshToken, 'refresh');
  });

  test('maps user profile from Remote DTO to Domain Entity', () {
    final mapper = createUserMapper();
    final entity = mapper.fromRemote(
      UserProfileApiDto(
        id: 'user-1',
        fullName: 'Ada Lovelace',
        email: 'ada@example.com',
        groupId: 'group-1',
        groupName: 'Computing',
      ),
    );

    expect(entity.id, 'user-1');
    expect(entity.fullName, 'Ada Lovelace');
    expect(entity.groupName, 'Computing');
  });

  test('maps homework across Remote, Local, and Domain layers', () {
    final mapper = createHomeworkMapper();
    final remote = HomeworkApiDto(
      homeworkId: 'homework-1',
      subject: 'Math',
      description: 'Exercises 1-10',
      dueDate: DateTime(2026, 8, 20),
      imageUrl: 'https://example.com/homework.png',
    );

    final entity = mapper.fromRemote(remote);
    final local = mapper.toLocal(entity);
    final restored = mapper.fromLocal(local);

    expect(local, isA<HomeworkBox>());
    expect(local.homeworkId, 'homework-1');
    expect(restored, entity);
  });

  test('maps schedule lists through ObjectBox ToMany relations', () {
    final mapper = createScheduleMapper();
    const remote = ScheduleApiDto(
      group: 'Computing',
      groupId: 'group-1',
      monday: [
        ScheduleItemDto(
          time: '08:00',
          subject: 'Math',
          teacher: 'Grace Hopper',
          room: '101',
          period: '1',
        ),
      ],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
    );

    final entity = mapper.fromRemote(remote);
    final local = mapper.toLocal(entity);
    final restored = mapper.fromLocal(local);

    expect(entity.monday.single.subject, 'Math');
    expect(local.monday.single.subject, 'Math');
    expect(restored.monday.single.teacher, 'Grace Hopper');
    expect(restored.groupId, 'group-1');
  });
}
