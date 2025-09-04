import 'package:dio/dio.dart';
import 'package:simi_inmobiliaria/core/config/constans/constants.dart';
import 'package:simi_inmobiliaria/core/errors/error.dart';
import 'package:simi_inmobiliaria/core/packages/dio_plugin.dart';
import 'package:simi_inmobiliaria/core/packages/storage/storage.dart';
import 'package:simi_inmobiliaria/features/auth/domain/datasource/auth_datasource.dart';
import 'package:simi_inmobiliaria/features/auth/domain/entities/user_entity.dart';
import 'package:simi_inmobiliaria/features/auth/infrastructure/models/user.dart';

import '../mappers/user_mapper.dart';

/// Implementación de [AuthDatasource] que gestiona la autenticación
/// del usuario mediante peticiones HTTP y almacenamiento local.
class AuthDatasourceImpl extends AuthDatasource {
  @override
  Future<UserEntity> checkAuthStatus(String token) {
    // TODO: Implementar verificación de autenticación con token
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> login({
    required String user,
    required String password,
  }) async {
    try {
      // 1. Solicita el inicio de sesión con las credenciales proporcionadas
      final response = await DioClient.dio.post(
        loginApi,
        data: {'username': user, 'password': password},
      );

      // 2. Extrae y guarda el token de autenticación localmente
      final token = response.data['token'];
      await KeyValueStorageServiceImpl.instance.setKeyValue<String>(
        'token',
        token,
      );
      await KeyValueStorageServiceImpl.instance.setKeyValue<String>(
        'idEmpresa',
        response.data['companies'][0]['CompaniaID'],
      );

      // 3. Configura el interceptor global con el token para futuras solicitudes
      DioClient.addAuthInterceptor();

      // 4. Convierte la respuesta JSON en una entidad de dominio del usuario
      final userModel = User.fromJson(response.data);
      return UserMapper.userJsonToEntity(userModel);
    } on DioException catch (e) {
      // 5. Maneja errores específicos de red o respuesta
      throw FetchException.handleDioException(e);
    }
  }

  @override
  Future<void> logout() {
    // TODO: Implementar cierre de sesión (borrar token, limpiar sesión, etc.)
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> register(Map<String, dynamic> json) {
    // TODO: Implementar registro de nuevo usuario
    throw UnimplementedError();
  }
}
