import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/src/exceptions/app_exception.dart';

abstract class AuthRepository {
  Future<User?> signInWithGoogle();
  Future<void> signOut();
  Stream<User?> authStateChanges();
   User? get currentUser; 
}

class FirebaseAuthRepo extends AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    final googleSignIn = GoogleSignIn();

    await googleSignIn.signOut();
  }

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));

        return userCredential.user;
      } else {
        throw const AppException.invalidGoogleIdToken();
      }
    } else {
      throw const AppException.signInCanceled();
    }
  }
}


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepo();
});

final authStateChangesProvider = StreamProvider<User?>((ref)  {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});