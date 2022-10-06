import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepository{
  Future<User?> signInWithGoogle();
  Future<void> signOut();
  Stream<User?> authStateChanges();
}

class FirebaseAuthRepo extends AuthRepository {
   final _firebaseAuth = FirebaseAuth.instance;

  
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    final googleSignIn = GoogleSignIn();

    await googleSignIn.signOut();
    
  }


  @override
  Stream<User?> authStateChanges() => _firebaseAuth.userChanges();

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
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_IDTOKEN',
            message: 'Missing Google IDtoken');
      }
    } else {
      throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER');
    }
  }

}