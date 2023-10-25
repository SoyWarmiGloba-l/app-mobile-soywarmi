import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticatorFirebaseRemoteDataSource {
  AuthenticatorFirebaseRemoteDataSource()
      : _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<void> signUp();

  Future<void> signIn({String? email, String? password});
}

class EmailAuthenticatorFirebaseRemoteDataSourceImplementation
    extends AuthenticatorFirebaseRemoteDataSource {
  @override
  Future<void> signIn({String? email, String? password}) async {
    if (email == null || password == null) {
      throw Exception('Error: User and password not provided');
    }

    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (result.user == null) {
      throw Exception('Error: User not found');
    }
  }

  @override
  Future<void> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}

class GoogleAuthenticatorFirebaseRemoteDataSourceImplementation
    extends AuthenticatorFirebaseRemoteDataSource {
  @override
  Future<void> signIn({String? email, String? password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
