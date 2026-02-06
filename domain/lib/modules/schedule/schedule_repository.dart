import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

import 'models/index.dart';

abstract class ScheduleRepository {
 Future<Either<Failure, ScheduleEntity>> getSchedule(String groupId);
 Future<Either<Failure, ScheduleEntity>> addSchedule(String groupId, File? image);

 Future<void> setSchedule(ScheduleEntity schedule);
 Future<ScheduleEntity> getScheduleFromCache(String groupId);
}