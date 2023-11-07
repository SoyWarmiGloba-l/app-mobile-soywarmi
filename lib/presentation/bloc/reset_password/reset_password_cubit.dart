
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soywarmi_app/domain/usescase/auth/reset_password_usecase.dart';
import 'package:soywarmi_app/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {

  ResetPasswordCubit({
    required ResetPasswordUseCase resetPasswordUseCase,
  })  : _resetPasswordUseCase = resetPasswordUseCase,
        super(ResetPasswordInitial());
  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    final result = await _resetPasswordUseCase(ResetPasswordParams(email: email));
    result.fold(
      (failure) => emit(ResetPasswordFailure(failure)),
      (success) => emit(ResetPasswordSuccess()),
    );
  }
  
}