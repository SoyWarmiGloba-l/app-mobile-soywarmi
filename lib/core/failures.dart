import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class GenericFailure extends Failure {}

class AuthenticationFailure extends Failure {
  AuthenticationFailure([String? message])
      : message =
            message ?? 'Ha ocurrido un error inesperado, inténtelo de nuevo.';

  factory AuthenticationFailure.fromSignInWithEmailCode(String code) {
    switch (code) {
      case 'invalid-email':
        return AuthenticationFailure(
          'El correo es inválido o tiene un formato incorrecto.',
        );
      case 'user-disabled':
        return AuthenticationFailure(
          'Este correo ha sido deshabilitado. Contacte a soporte por ayuda.',
        );
      case 'user-not-found':
        return AuthenticationFailure(
          'Usuario no registrado, verifique que su correo sea el correcto.',
        );
      case 'wrong-password':
        return AuthenticationFailure(
          'La contraseña es incorrecta.',
        );
      default:
        return AuthenticationFailure();
    }
  }

  factory AuthenticationFailure.fromSignUpWithEmailCode(String code) {
    switch (code) {
      case 'invalid-email':
        return AuthenticationFailure(
          'El correo es inválido o tiene un formato incorrecto.',
        );
      case 'user-disabled':
        return AuthenticationFailure(
          'Este correo ha sido deshabilitado. Contacta a soporte por ayuda.',
        );
      case 'email-already-in-use':
        return AuthenticationFailure(
          'El correo ya está en uso con otra cuenta.',
        );
      case 'operation-not-allowed':
        return AuthenticationFailure(
          'Operación no permitida. Por favor contacte a soporte.',
        );
      case 'weak-password':
        return AuthenticationFailure(
          'La contraseña ingresada es insegura.',
        );
      default:
        return AuthenticationFailure();
    }
  }
  final String message;

  @override
  List<Object> get props => [message];
}
