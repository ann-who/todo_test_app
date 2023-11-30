abstract class AuthentificationDataSource {
  Future<void> createOrSignIn(String email, String password);
  Future<void> signOut();
}
