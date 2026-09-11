import 'package:common/constants/failure_class.dart';
import 'package:common/constants/post_classes.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/homework_mapper.dart';
import 'package:data/modules/homework/models/remote/index.dart';
import 'package:data/modules/homework/sources/local/homework_local_source.dart';
import 'package:data/modules/homework/sources/remote/homework_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/homework/homework_repository.dart';
import 'package:domain/modules/homework/models/index.dart';
import 'package:smart_repository/smart_repository.dart';

part 'homework_repository_impl.g.dart';

Failure mapHomeworkFailure(Object error, StackTrace? stackTrace) =>
    error is DioException
    ? Failure.dio(error)
    : Failure.error(error, stackTrace);

@GenerateRepository(
  contract: HomeworkRepository,
  remote: HomeworkApiService,
  cache: HomeworkLocalSource,
  mapError: mapHomeworkFailure,
  methods: {
    #addHomework: RepositoryOperation.mutation(
      argumentsFrom: #request,
      callArguments: {
        #dueDate: RepositoryArgument(#request, property: #dueDateFormatted),
      },
    ),
    #getHomeworks: RepositoryOperation.remoteOnly(),
    #getHomework: RepositoryOperation.remoteOnly(),
    #editHomework: RepositoryOperation.mutation(argumentsFrom: #request),
    #deleteHomework: RepositoryOperation.mutation(),
    #markHomeworkDone: RepositoryOperation.mutation(),
    #reopenHomework: RepositoryOperation.mutation(),
    #getHomeworksFromCache: RepositoryLocalStream(
      source: #getHomeworkFromCache,
    ),
  },
)
abstract class HomeworkRepositoryBinding {}
