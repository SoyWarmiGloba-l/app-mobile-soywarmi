import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/entity/user_entity.dart';

abstract class AuthenticationStateRepository {
  Stream<bool> get authenticationStatus;
  Future<Either<AuthenticationFailure, void>> signOut();
  Future<Either<AuthenticationFailure, UserEntity?>> get user;
  Future<Either<AuthenticationFailure, void>> sendPasswordResetEmail(
      String email);
}
