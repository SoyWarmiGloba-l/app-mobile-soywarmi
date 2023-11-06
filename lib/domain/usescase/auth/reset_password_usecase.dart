import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/repository/authentication_state_repository.dart';

class ResetPasswordUseCase extends FutureUsesCase<void, ResetPasswordParams> {
 ResetPasswordUseCase({
    required AuthenticationStateRepository authenticatorRepository,
  }) : _authenticatorRepository = authenticatorRepository;
  final AuthenticationStateRepository _authenticatorRepository;
  @override
  Future<Either<AuthenticationFailure, void>> call(
      ResetPasswordParams params) async {
    return await _authenticatorRepository.sendPasswordResetEmail(params.email);
  }
}

class ResetPasswordParams {
  ResetPasswordParams({required this.email});
  final String email;
}
