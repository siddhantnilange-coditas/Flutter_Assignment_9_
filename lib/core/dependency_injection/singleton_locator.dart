import 'package:get_it/get_it.dart';
import 'package:navigation_assignment/features/authentication/data/datasource/firebase_auth_services.dart';
import 'package:navigation_assignment/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:navigation_assignment/features/authentication/domain/repositories/auth_repository.dart';
import 'package:navigation_assignment/features/authentication/domain/usecases/auth_usecases.dart';

final locator = GetIt.instance;

void setDi(){

  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<AuthUseCases>(AuthUseCases());
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  // locator.registerSingleton<AuthData>(instance)

}