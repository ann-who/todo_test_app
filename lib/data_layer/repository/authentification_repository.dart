abstract class AuthentificationRepository {
  Future<void> createOrSignIn(String email, String password);
  Future<void> signOut();
}
