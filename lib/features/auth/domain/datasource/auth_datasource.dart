import '../entities/user_entity.dart';

abstract class AuthDatasource {
  Future<UserEntity> login({required String user, required String password});
  Future<UserEntity> register(Map<String, dynamic> json);
  Future<UserEntity> checkAuthStatus(String token);
  Future<void> logout();
}
