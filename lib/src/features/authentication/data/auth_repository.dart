abstract class AuthRepository{
  Future<void> signInWithGoogle();
}

class FirebaseAuthRepo extends AuthRepository {
  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

}