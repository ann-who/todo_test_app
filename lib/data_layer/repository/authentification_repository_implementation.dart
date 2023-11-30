import 'package:todo_test_app/data_layer/data_source/authentification_data_source.dart';
import 'package:todo_test_app/data_layer/repository/authentification_repository.dart';

class AuthentificationRepositoryImplementation
    implements AuthentificationRepository {
  final AuthentificationDataSource authDataSource;

  const AuthentificationRepositoryImplementation(
      {required this.authDataSource});

  @override
  Future<void> createOrSignIn(String email, String password) async {
    await authDataSource.createOrSignIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await authDataSource.signOut();
  }
}
