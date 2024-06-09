import 'package:navigation_assignment/core/dependency_injection/singleton_locator.dart';
import 'package:navigation_assignment/features/authentication/data/datasource/firebase_auth_services.dart';
import 'package:navigation_assignment/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<String?> registration(String email, String password) async {
   return await locator<AuthService>().registration(email: email, password: password);
  }

  @override
  Future<String?> signIn(String email, String password) async {
return await locator<AuthService>().login(email: email, password: password);
  }
}