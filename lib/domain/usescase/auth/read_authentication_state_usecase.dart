import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/data/repository/authentication_state_repositoy_implementation.dart';
import 'package:soywarmi_app/domain/entity/user_entity.dart';
import 'package:soywarmi_app/domain/repository/authentication_state_repository.dart';

class ReadUserAuthenticationStateUseCase
    extends FutureUsesCase<UserEntity?, NoParams> {
  ReadUserAuthenticationStateUseCase({
    AuthenticationStateRepository? authenticationStateRepository,
  }) : _authenticationStateRepository = authenticationStateRepository ??
            AuthenticationStateRepositoryImplementation();
  final AuthenticationStateRepository _authenticationStateRepository;
  Stream<bool> get isAuthenticated =>
      _authenticationStateRepository.authenticationStatus;

  @override
  Future<Either<AuthenticationFailure, UserEntity?>> call(NoParams params) {
    return _authenticationStateRepository.user;
  }
}
