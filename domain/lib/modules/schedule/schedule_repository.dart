import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

import 'models/index.dart';

abstract class ScheduleRepository {
  Future<Result<ScheduleEntity, Failure>> getSchedule(String groupId);
  Future<Result<ScheduleEntity, Failure>> addSchedule(
    String groupId,
    File? image,
  );

  Future<void> setSchedule(ScheduleEntity schedule);
  Future<ScheduleEntity> getScheduleFromCache(String groupId);
}
