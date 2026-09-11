// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework_repository_impl.dart';

// **************************************************************************
// RepositoryBindingGenerator
// **************************************************************************

/// Generated implementation of `HomeworkRepository`.
final class HomeworkRepositoryImpl implements HomeworkRepository {
  HomeworkRepositoryImpl({
    required HomeworkApiService remote,
    required HomeworkLocalSource cache,
  }) : _remote = remote,
       _local = cache,
       _actions = RepositoryActionExecutor(mapError: mapHomeworkFailure);

  final HomeworkApiService _remote;

  final HomeworkLocalSource _local;
  final RepositoryActionExecutor _actions;

  @override
  Future<Either<Failure, HomeworkEntity>> addHomework(
    CreateHomeworkRequest request,
  ) async {
    return ((RepositoryResult<HomeworkEntity> result) =>
        result.fold<Either<Failure, HomeworkEntity>>(
          onSuccess: (value) => Right<Failure, HomeworkEntity>(value),
          onFailure: (error, _) =>
              Left<Failure, HomeworkEntity>(error as Failure),
        ))(
      await _actions.execute<HomeworkEntity, HomeworkApiDto>(
        operationKey: #addHomework,
        requestKey: request,
        remote: () => _remote.addHomework(
          groupId: request.groupId,
          subject: request.subject,
          description: request.description,
          dueDate: request.dueDateFormatted,
          imageFile: request.imageFile,
        ),
        mapResult: (value) => HomeworkToEntityMapper(value).toEntity,
        deduplicate: false,
      ),
    );
  }

  @override
  Future<Either<Failure, List<HomeworkEntity>>> getHomeworks(
    String groupId,
  ) async {
    return ((RepositoryResult<List<HomeworkEntity>> result) =>
        result.fold<Either<Failure, List<HomeworkEntity>>>(
          onSuccess: (value) => Right<Failure, List<HomeworkEntity>>(value),
          onFailure: (error, _) =>
              Left<Failure, List<HomeworkEntity>>(error as Failure),
        ))(
      await _actions.execute<List<HomeworkEntity>, List<HomeworkApiDto>>(
        operationKey: #getHomeworks,
        requestKey: groupId,
        remote: () => _remote.getHomeworks(groupId),
        mapResult: (value) =>
            value.map((item) => HomeworkToEntityMapper(item).toEntity).toList(),
        deduplicate: true,
      ),
    );
  }

  @override
  Future<Either<Failure, HomeworkEntity>> getHomework(String homeworkId) async {
    return ((RepositoryResult<HomeworkEntity> result) =>
        result.fold<Either<Failure, HomeworkEntity>>(
          onSuccess: (value) => Right<Failure, HomeworkEntity>(value),
          onFailure: (error, _) =>
              Left<Failure, HomeworkEntity>(error as Failure),
        ))(
      await _actions.execute<HomeworkEntity, HomeworkApiDto>(
        operationKey: #getHomework,
        requestKey: homeworkId,
        remote: () => _remote.getHomework(homeworkId),
        mapResult: (value) => HomeworkToEntityMapper(value).toEntity,
        deduplicate: true,
      ),
    );
  }

  @override
  Future<Either<Failure, HomeworkEntity>> editHomework(
    EditHomeworkRequest request,
  ) async {
    return ((RepositoryResult<HomeworkEntity> result) =>
        result.fold<Either<Failure, HomeworkEntity>>(
          onSuccess: (value) => Right<Failure, HomeworkEntity>(value),
          onFailure: (error, _) =>
              Left<Failure, HomeworkEntity>(error as Failure),
        ))(
      await _actions.execute<HomeworkEntity, HomeworkApiDto>(
        operationKey: #editHomework,
        requestKey: request,
        remote: () => _remote.editHomework(
          homeworkId: request.homeworkId,
          subject: request.subject,
          description: request.description,
          dueDate: request.dueDate,
        ),
        mapResult: (value) => HomeworkToEntityMapper(value).toEntity,
        deduplicate: false,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> deleteHomework(String homeworkId) async {
    return ((RepositoryResult<void> result) =>
        result.fold<Either<Failure, void>>(
          onSuccess: (value) => Right<Failure, void>(null),
          onFailure: (error, _) => Left<Failure, void>(error as Failure),
        ))(
      await _actions.execute<void, void>(
        operationKey: #deleteHomework,
        requestKey: homeworkId,
        remote: () => _remote.deleteHomework(homeworkId),
        mapResult: (_) {},
        deduplicate: false,
      ),
    );
  }

  @override
  Future<Either<Failure, HomeworkEntity>> markHomeworkDone(
    String homeworkId,
  ) async {
    return ((RepositoryResult<HomeworkEntity> result) =>
        result.fold<Either<Failure, HomeworkEntity>>(
          onSuccess: (value) => Right<Failure, HomeworkEntity>(value),
          onFailure: (error, _) =>
              Left<Failure, HomeworkEntity>(error as Failure),
        ))(
      await _actions.execute<HomeworkEntity, HomeworkApiDto>(
        operationKey: #markHomeworkDone,
        requestKey: homeworkId,
        remote: () => _remote.markHomeworkDone(homeworkId),
        mapResult: (value) => HomeworkToEntityMapper(value).toEntity,
        deduplicate: false,
      ),
    );
  }

  @override
  Future<Either<Failure, HomeworkEntity>> reopenHomework(
    String homeworkId,
  ) async {
    return ((RepositoryResult<HomeworkEntity> result) =>
        result.fold<Either<Failure, HomeworkEntity>>(
          onSuccess: (value) => Right<Failure, HomeworkEntity>(value),
          onFailure: (error, _) =>
              Left<Failure, HomeworkEntity>(error as Failure),
        ))(
      await _actions.execute<HomeworkEntity, HomeworkApiDto>(
        operationKey: #reopenHomework,
        requestKey: homeworkId,
        remote: () => _remote.reopenHomework(homeworkId),
        mapResult: (value) => HomeworkToEntityMapper(value).toEntity,
        deduplicate: false,
      ),
    );
  }

  @override
  Stream<List<HomeworkEntity>> getHomeworksFromCache() {
    return _local.getHomeworkFromCache().map(
      (value) => value
          .map((item) => HomeworkBoxToEntityMapper(item).toEntity)
          .toList(),
    );
  }

  @override
  Future<void> setHomework(List<HomeworkEntity> homeworks) =>
      _local.setHomework(homeworks);

  /// Releases every generated repository resource.
  Future<void> dispose() async {
    await Future.wait<void>([]);
  }
}
