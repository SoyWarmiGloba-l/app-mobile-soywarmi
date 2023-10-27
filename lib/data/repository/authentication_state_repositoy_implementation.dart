import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/data/remote/authentication_state_firebase_remote_data_source.dart';
import 'package:soywarmi_app/domain/entity/user_entity.dart';
import 'package:soywarmi_app/domain/repository/authentication_state_repository.dart';

class AuthenticationStateRepositoryImplementation
    extends AuthenticationStateRepository {
  AuthenticationStateRepositoryImplementation({
    AuthenticationFirebaseRemoteDataSource? authenticationDataSource,
  }) : _authenticationDataSource = authenticationDataSource ??
            AuthenticationFirebaseRemoteDataSourceImplementation();
  final AuthenticationFirebaseRemoteDataSource _authenticationDataSource;

  @override
  Stream<bool> get authenticationStatus =>
      _authenticationDataSource.isAuthenticated;

  @override
  Future<Either<AuthenticationFailure, void>> signOut() async {
    try {
      final voidResult = await _authenticationDataSource.signOut();
      return Right(voidResult);
    } on Exception {
      return Left(AuthenticationFailure());
    }
  }

  @override
  Future<Either<AuthenticationFailure, UserEntity?>> get user async {
    try {
      final userModel = await _authenticationDataSource.user;
      if (userModel == null) return const Right(null);

      final userEntity = UserEntity(
        id: userModel.id,
        email: userModel.email,
        password: userModel.password,
        rol: userModel.rol,
      );

      return Right(userEntity);
    } on Exception {
      return Left(AuthenticationFailure());
    }
  }
}
