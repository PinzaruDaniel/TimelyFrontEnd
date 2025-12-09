import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';

class AddScheduleUseCase extends UseCase<ScheduleEntity, AddScheduleParams> {
  final ScheduleRepository repository;
  AddScheduleUseCase({required this.repository});

  @override
  Future<Either<Failure, ScheduleEntity>> call(AddScheduleParams params) {
    return repository.addSchedule(params.groupId, params.image);
  }


}

class AddScheduleParams {
  final String groupId;
  final File image;
  AddScheduleParams({required this.groupId, required this.image});
}