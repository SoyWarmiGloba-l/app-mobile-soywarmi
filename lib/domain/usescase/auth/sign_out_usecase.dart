import 'package:dartz/dartz.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/core/usecases.dart';
import 'package:soywarmi_app/data/repository/authentication_state_repositoy_implementation.dart';
import 'package:soywarmi_app/domain/repository/authentication_state_repository.dart';

class SignOutUseCase extends FutureUsesCase<void, NoParams> {
  SignOutUseCase({AuthenticationStateRepository? authenticationStateRepository})
      : _authenticationStateRepository = authenticationStateRepository ??
            AuthenticationStateRepositoryImplementation();

  final AuthenticationStateRepository _authenticationStateRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _authenticationStateRepository.signOut();
  }
}
