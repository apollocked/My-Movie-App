import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Stream<UserModel?> get authStateChanges;
  Future<UserModel> signUp({required String email, required String password});
  Future<UserModel> logIn({required String email, required String password});
  Future<void> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<UserModel?> get authStateChanges => _firebaseAuth
      .authStateChanges()
      .map((user) => user != null ? UserModel.fromFirebase(user) : null);

  @override
  Future<UserModel> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return UserModel.fromFirebase(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Sign up failed.');
    }
  }

  @override
  Future<UserModel> logIn(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel.fromFirebase(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Authentication failed.');
    }
  }

  @override
  Future<void> logOut() => _firebaseAuth.signOut();
}
