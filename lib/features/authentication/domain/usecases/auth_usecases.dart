import 'package:navigation_assignment/core/dependency_injection/singleton_locator.dart';
import 'package:navigation_assignment/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:navigation_assignment/features/authentication/domain/repositories/auth_repository.dart';

class AuthUseCases{

  Future<String?> loginUser(String email, String password) async {
    return await locator<AuthRepository>().signIn(email, password);
  }

  Future<String?> registerUser(String email, String password) async {
    return await locator<AuthRepository>().registration(email, password);
  }
}