import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';

import '../../mapper/schedule_mapper.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleApiService apiService;
  final ScheduleLocalSource localSource;

  ScheduleRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<Either<Failure, ScheduleEntity>> getSchedule(String groupId) async {
    try {
      final value = await apiService.getSchedule(groupId);
      print('Schedule received: ${value.group}');
      return Right(value.toEntity);
    } catch (e, stackTrace) {
      print('Schedule API failed: $e  ${e.runtimeType}');
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, ScheduleEntity>> addSchedule(String groupId, File? image) async {
    try {
      final response = await apiService.addSchedule(
        groupId,
        image != null ? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last) : null,
      );
      print('schedule received: ${response.groupId}');
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      print('Schedule API failed: $e  ${e.runtimeType}');
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<ScheduleEntity> getScheduleFromCache(String groupId) async {
    var scheduleBox = await localSource.getScheduleFromCache(groupId);
    return scheduleBox.toEntity;
  }

  @override
  Future<void> setSchedule(ScheduleEntity schedule) async {
    localSource.setSchedule(schedule);
  }
}
