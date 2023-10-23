import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/domain/repository/authentication_state_repository.dart';

class SignOutUseCase extends FutureUsesCase<void, NoParams> {
  SignOutUseCase({
    required AuthenticationStateRepository? authenticationStateRepository,
  }) : _authenticationStateRepository = authenticationStateRepository;

  final AuthenticationStateRepository? _authenticationStateRepository;
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _authenticationStateRepository!.signOut();
  }
}
