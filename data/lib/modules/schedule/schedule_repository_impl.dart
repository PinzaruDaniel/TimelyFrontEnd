import 'dart:io';

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/schedule/models/local/schedule_box.dart';
import 'package:data/modules/schedule/models/remote/index.dart';
import 'package:data/modules/schedule/sources/local/schedule_local_source.dart';
import 'package:data/modules/schedule/sources/remote/schedule_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/schedule/models/index.dart';
import 'package:domain/modules/schedule/schedule_repository.dart';
import 'package:smart_repository/smart_repository.dart';

import '../../mapper/schedule_mapper.dart';

part 'schedule_repository_impl.g.dart';

@SmartRepositoryFamilyAdapter<String, ScheduleEntity, ScheduleApiDto, ScheduleBox>()
class ScheduleRepositoryImpl with _$ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleApiService apiService;
  final ScheduleLocalSource localSource;

  ScheduleRepositoryImpl({required this.apiService, required this.localSource});

  @override
  Future<ScheduleApiDto> smartLoadRemote(String groupId) => apiService.getSchedule(groupId);

  @override
  Future<ScheduleBox?> smartLoadLocal(String groupId) => localSource.getScheduleFromCache(groupId);

  @override
  Future<void> smartSaveLocal(String groupId, ScheduleBox schedule) => localSource.setSchedule(schedule);

  @override
  ScheduleEntity smartMapRemote(ScheduleApiDto schedule) => schedule.toEntity;

  @override
  ScheduleEntity smartMapLocal(ScheduleBox schedule) => schedule.toEntity;

  @override
  ScheduleBox smartMapToLocal(ScheduleEntity schedule) => schedule.toBox;

  @override
  bool smartFallbackWhen(String key, Object error) => _shouldUseCachedSchedule(error);

  @override
  Future<Either<Failure, ScheduleEntity>> getSchedule(String groupId) async {
    final result = await smartGet(groupId);
    return result.fold(
      onSuccess: (schedule) => Right(schedule),
      onFailure: (error, stackTrace) => Left(_toFailure(error, stackTrace)),
    );
  }

  @override
  Future<Either<Failure, ScheduleEntity>> addSchedule(String groupId, File? image) async {
    try {
      final response = await apiService.addSchedule(
        groupId,
        image != null ? await MultipartFile.fromFile(image.path, filename: image.path.split('/').last) : null,
      );
      final schedule = response.toEntity;
      final persistence = await smartSetLocal(groupId, schedule);
      return persistence.fold(
        onSuccess: (_) => Right(schedule),
        onFailure: (error, stackTrace) => Left(_toFailure(error, stackTrace)),
      );
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<ScheduleEntity> getScheduleFromCache(String groupId) async {
    return (await smartGet(groupId, policy: RepositoryPolicy.cacheOnly)).getOrThrow();
  }

  @override
  Future<void> setSchedule(ScheduleEntity schedule) async {
    (await smartSetLocal(schedule.groupId, schedule)).getOrThrow();
  }

  Future<void> dispose() => disposeSmartRepository();

  static bool _shouldUseCachedSchedule(Object error) {
    if (error is SocketException) return true;
    if (error is! DioException) return false;

    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError => true,
      DioExceptionType.unknown => error.error is SocketException,
      DioExceptionType.badResponse => (error.response?.statusCode ?? 0) >= 500,
      DioExceptionType.cancel || DioExceptionType.badCertificate => false,
    };
  }

  static Failure _toFailure(Object error, StackTrace? stackTrace) {
    if (error is DioException) return Failure.dio(error);
    return Failure.error(error, stackTrace);
  }
}
