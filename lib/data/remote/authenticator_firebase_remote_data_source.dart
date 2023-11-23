import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soywarmi_app/data/remote/user_public_general_remote_data_source.dart';

abstract class AuthenticatorFirebaseRemoteDataSource {
  AuthenticatorFirebaseRemoteDataSource()
      : _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<void> signUp({String? nombre, String? apellido,String? email,String? password});

  Future<void> signIn({String? email, String? password});
}

class EmailAuthenticatorFirebaseRemoteDataSourceImplementation
    extends AuthenticatorFirebaseRemoteDataSource {
  final storage = const FlutterSecureStorage();
  @override
  Future<void> signIn({String? email, String? password}) async {
    if (email == null || password == null) {
      throw Exception('Error: User and password not provided');
    }

    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userToken = await result.user!.getIdToken();

    await storage.write(key: 'USER_TOKEN', value: userToken);

    if (result.user == null) {
      throw Exception('Error: User not found');
    }
  }

  @override
  Future<void> signUp({String? nombre, String? apellido,String? email,String? password}) async {
    if (email == null || password == null || nombre==null || apellido==null) {
      throw Exception('Error: User and password not provided');
    }

    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final userToken = await userCredential.user!.getIdToken();
    if(userCredential.user?.uid != null){
      UserPublicGeneralRemoteDataSourceImplementation upgrds=new UserPublicGeneralRemoteDataSourceImplementation();
        Map<String, dynamic> jsonData = {
          "id":userCredential.user?.uid,
          "name": '${nombre} ${apellido}',
          "email": email,
          "password": password,
        };
        String encode=jsonEncode(jsonData);
        upgrds.postUser(encode);

      await storage.write(key: 'USER_TOKEN', value: userToken);
    }


    if (userCredential.user == null) {
      throw Exception('Error: User cannot be register');
    }
  }
}

class GoogleAuthenticatorFirebaseRemoteDataSourceImplementation
    extends AuthenticatorFirebaseRemoteDataSource {
  final storage = const FlutterSecureStorage();
  @override
  Future<void> signIn({String? email, String? password}) async {
    try {
      final googleSingIn = GoogleSignIn();
      final googleAccount = await googleSingIn.signIn();

      if (googleAccount == null) {
        throw Exception('Error: Google sign-in was cancelled by the user');
      }

      final googleAuth = await googleAccount.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _firebaseAuth.signInWithCredential(credential);

      final userToken = await result.user!.getIdToken();
      await storage.write(key: "USER_TOKEN", value: userToken);
    } catch (e) {
      if (e is PlatformException && e.code == 'sign_in_canceled') {
        throw Exception('Error: Google sign-in was cancelled by the user');
      }

      if (e is PlatformException) {
        throw Exception('Platform exception code ${e.code} $e');
      }

      throw Exception('Error: Failed to sign in with Google $e');
    }
  }

  @override
  Future<void> signUp({String? nombre, String? apellido,String? email,String? password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}

