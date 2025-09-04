

import 'package:simi_inmobiliaria/features/auth/domain/datasource/auth_datasource.dart';
import 'package:simi_inmobiliaria/features/auth/domain/entities/user_entity.dart';
import 'package:simi_inmobiliaria/features/auth/domain/repositories/auth_repository.dart';
import 'package:simi_inmobiliaria/features/auth/infrastructure/datasource/auth_datasource_impl.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({AuthDatasource? authDataSource})
    : authDataSource = authDataSource ?? AuthDatasourceImpl();

  final AuthDatasource authDataSource;

  @override
  Future<UserEntity> checkAuthStatus(String token) {
    return authDataSource.checkAuthStatus(token);
  }

  @override
  Future<UserEntity> login({required String user, required String password}) {
    return authDataSource.login(user: user, password: password);
  }

  @override
  Future<void> logout() {
    return authDataSource.logout();
  }

  @override
  Future<UserEntity> register(Map<String, dynamic> json) {
    return authDataSource.register(json);
  }
}
