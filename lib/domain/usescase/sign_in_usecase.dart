import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/repository/authenticator_repository.dart';

class SignInUseCase extends FutureUsesCase<void, SignInParams> {
  SignInUseCase({
    required AuthenticatorRepository authenticatorRepository,
  }) : _authenticatorRepository = authenticatorRepository;

  final AuthenticatorRepository _authenticatorRepository;
  @override
  Future<Either<Failure, void>> call(SignInParams params) {
    return _authenticatorRepository.signIn(
      params.type,
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  const SignInParams({required this.type, this.email, this.password});
  final String type;
  final String? email;
  final String? password;
}
