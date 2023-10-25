import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soywarmi_app/data/model/user_model.dart';

abstract class AuthenticationFirebaseRemoteDataSource {
  Stream<bool> get isAuthenticated;

  Future<UserModel?> get user;

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();
}

class AuthenticationFirebaseRemoteDataSourceImplementation
    extends AuthenticationFirebaseRemoteDataSource {
  AuthenticationFirebaseRemoteDataSourceImplementation()
      : _firebaseAuth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn();

  final FirebaseAuth _firebaseAuth;

  final GoogleSignIn _googleSignIn;

  @override
  Stream<bool> get isAuthenticated async* {
    yield _firebaseAuth.currentUser != null;
    await for (final _ in _firebaseAuth.authStateChanges()) {
      yield _firebaseAuth.currentUser != null;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> get user async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return UserModel(
        id: user.uid,
        email: user.email!,
        password: '',
        rol: '',
      );
    } else {
      return null;
    }
  }
}
