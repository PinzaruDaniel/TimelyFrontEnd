import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
abstract class UseCaseStream<T, Params>{
  Stream<T> call(Params params);
}

abstract class UseCaseNoParams<T> {
  Future<Either<Failure, T>> call();
}
abstract class UseCaseNoEither<T, Params>{
  Future<T> call(Params params);
}
abstract class UseCaseNoEitherNoParams<T>{
  Stream<T> call();
}
abstract class UseCaseNoEitherNoParamsNoStream<T>{
  Future<T>call();
}

abstract class UseCaseStreamNullable<T, Params>{
  Stream<T?> call(Params params);
}
abstract class UseCaseNoEitherNoStreamNullable<T, Params>{
  Future<T?> call(Params params);
}


