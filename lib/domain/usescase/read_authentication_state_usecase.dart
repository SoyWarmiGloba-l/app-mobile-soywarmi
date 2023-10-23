import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/user_entity.dart';
import 'package:soywarmi_app/domain/repository/authentication_state_repository.dart';

class ReadAuthenticationStateUseCase
    extends FutureUsesCase<UserEntity?, NoParams> {
  ReadAuthenticationStateUseCase({
    required AuthenticationStateRepository? authenticationStateRepository,
  }) : _authenticationStateRepository = authenticationStateRepository;

  final AuthenticationStateRepository? _authenticationStateRepository;
  Stream<bool> get isAuthenticated =>
      _authenticationStateRepository!.authenticationStatus;
  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) {
    return _authenticationStateRepository!.user;
  }
}
