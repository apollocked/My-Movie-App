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
      final user = credential.user;
      if (user == null) throw Exception('Sign up failed.');
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      throw Exception(_friendlyAuthMessage(e.code));
    }
  }

  @override
  Future<UserModel> logIn(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      if (user == null) throw Exception('Authentication failed.');
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      throw Exception(_friendlyAuthMessage(e.code));
    }
  }

  String _friendlyAuthMessage(String code) {
    switch (code) {
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'Invalid email or password.';
      case 'email-already-in-use':
        return 'An account with this email already exists.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }

  @override
  Future<void> logOut() => _firebaseAuth.signOut();
}
