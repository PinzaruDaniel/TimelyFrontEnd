export 'package:smart_domain/smart_domain.dart'
    show
        FailureResult,
        NoParams,
        NoParamsUseCase,
        Result,
        ResultStreamUseCase,
        ResultUseCase,
        StreamUseCase,
        Success,
        UseCase;

abstract class UseCaseStream<T, Params> {
  Stream<T> call(Params params);
}

abstract class UseCaseNoEither<T, Params> {
  Future<T> call(Params params);
}

abstract class UseCaseNoEitherNoParams<T> {
  Stream<T> call();
}

abstract class UseCaseNoEitherNoParamsNoStream<T> {
  Future<T> call();
}

abstract class UseCaseStreamNullable<T, Params> {
  Stream<T?> call(Params params);
}

abstract class UseCaseNoEitherNoStreamNullable<T, Params> {
  Future<T?> call(Params params);
}
