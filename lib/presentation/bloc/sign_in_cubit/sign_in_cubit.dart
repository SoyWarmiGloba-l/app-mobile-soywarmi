import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/core/failures.dart';
import 'package:soywarmi_app/domain/usescase/auth/sign_in_usecase.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required SignInUseCase signInUseCase,
  })  : _signInUseCase = signInUseCase,
        super(SignInInitial());

  final SignInUseCase _signInUseCase;

  Future<void> signIn(String type, {String? email, String? password}) async {
    emit(SignInLoading());

    final result = await _signInUseCase(
      SignInParams(
        type: type,
        email: email,
        password: password,
      ),
    );

    result.fold(
      (failure) => emit(SignInFailed(failure)),
      (success) => emit(SignInSuccess()),
    );
  }
}
