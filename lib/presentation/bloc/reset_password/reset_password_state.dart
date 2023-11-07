import 'package:equatable/equatable.dart';
import 'package:soywarmi_app/core/failures.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  ResetPasswordFailure(AuthenticationFailure failure)
      : message = failure.message;
  final String message;

  @override
  List<Object> get props => [message];
}
