import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';

abstract class UsesCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class FutureUsesCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUsesCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

class NoParams {}
