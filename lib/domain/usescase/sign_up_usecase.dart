import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/entity/user_entity.dart';
import 'package:soywarmi_app/domain/repository/authenticator_repository.dart';

class SignUpUseCase extends FutureUsesCase<void, SignUpParams> {
  SignUpUseCase({
    required AuthenticatorRepository authenticatorRepository,
  }) : _authenticatorRepository = authenticatorRepository;

  final AuthenticatorRepository _authenticatorRepository;
  @override
  Future<Either<Failure, void>> call(SignUpParams params) {
    return _authenticatorRepository.signUp(
      user: params.user,
      password: params.password,
    );
  }
}

class SignUpParams {
  const SignUpParams({this.user, this.password});
  final UserEntity? user;
  final String? password;
}
