import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import 'models/index.dart';

abstract class ScheduleRepository {
 Future<Either<Failure, ScheduleEntity>> getSchedule(Uuid groupId);
}