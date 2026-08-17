import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:data/core/app_failure_mapper.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:smart_domain/smart_domain.dart' show Result;

import '../../mapper/schedule_mapper.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleApiService apiService;
  final ScheduleLocalSource localSource;

  ScheduleRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<Result<ScheduleEntity, Failure>> getSchedule(String groupId) {
    return Result.guardAsync(() async {
      final value = await apiService.getSchedule(groupId);
      print('Schedule received: ${value.group}');
      return value.toEntity;
    }, onError: appFailureMapper.map);
  }

  @override
  Future<Result<ScheduleEntity, Failure>> addSchedule(
    String groupId,
    File? image,
  ) {
    return Result.guardAsync(() async {
      final response = await apiService.addSchedule(
        groupId,
        image != null
            ? await MultipartFile.fromFile(
                image.path,
                filename: image.path.split('/').last,
              )
            : null,
      );
      print('schedule received: ${response.groupId}');
      return response.toEntity;
    }, onError: appFailureMapper.map);
  }

  @override
  Future<ScheduleEntity> getScheduleFromCache(String groupId) async {
    var scheduleBox = await localSource.getScheduleFromCache(groupId);
    return ScheduleBoxToEntityMapper(scheduleBox).toEntity;
  }

  @override
  Future<void> setSchedule(ScheduleEntity schedule) async {
    localSource.setSchedule(schedule);
  }
}
