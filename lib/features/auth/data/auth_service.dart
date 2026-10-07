import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nectar_store/features/auth/data/user_repository.dart';

class AuthService {
  AuthService({
    FirebaseAuth? auth,
    GoogleSignIn? googleSignIn,
    UserRepository? userRepository,
  }) : _auth = auth ?? FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn.instance,
       _userRepository = userRepository ?? UserRepository();

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final UserRepository _userRepository;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;

    if (user == null) {
      throw FirebaseAuthException(code: 'user-null');
    }

    unawaited(_userRepository.updateLastLogin(user.uid));

    return user;
  }

  Future<User> signInWithGoogle() async {
    final googleUser = await _googleSignIn.authenticate();

    final googleAuth = googleUser.authentication;

    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw FirebaseAuthException(
        code: 'missing-google-id-token',
        message: 'Google ID token is null.',
      );
    }

    final credential = GoogleAuthProvider.credential(idToken: idToken);

    final result = await _auth.signInWithCredential(credential);

    final user = result.user;

    if (user == null) {
      throw FirebaseAuthException(code: 'user-null');
    }

    unawaited(_saveGoogleUser(user));

    return user;
  }

  Future<User> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;

    if (user == null) {
      throw FirebaseAuthException(code: 'user-null');
    }

    await user.updateDisplayName(username);
    await user.reload();

    final updatedUser = _auth.currentUser ?? user;

    await _userRepository.saveUser(
      uid: updatedUser.uid,
      name: username,
      email: updatedUser.email ?? '',
      provider: 'email',
    );

    return updatedUser;
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (_) {}

    await _auth.signOut();
  }

  Future<void> _saveGoogleUser(User user) async {
    try {
      await _userRepository.saveUser(
        uid: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        photoUrl: user.photoURL ?? '',
        phone: user.phoneNumber ?? '',
        provider: 'google',
      );
    } catch (_) {}
  }
}
