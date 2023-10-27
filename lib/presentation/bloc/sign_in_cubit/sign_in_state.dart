part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailed extends SignInState {
  SignInFailed(AuthenticationFailure failure) : message = failure.message;
  final String message;

  @override
  List<Object> get props => [message];
}
