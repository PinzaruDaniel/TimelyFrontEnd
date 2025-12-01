import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/schedule/sources/schedule_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:uuid/uuid.dart';

import '../../mapper/schedule_mapper.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleApiService _apiService;

  ScheduleRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, ScheduleEntity>> getSchedule(Uuid groupId) async {
    try {
      return await _apiService.getSchedule(groupId).then((value) => Right(value.toEntity));
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}
