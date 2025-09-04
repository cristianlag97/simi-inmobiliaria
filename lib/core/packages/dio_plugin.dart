import 'package:dio/dio.dart';
import 'package:simi_inmobiliaria/core/packages/dotenv_plugin.dart';
import 'package:simi_inmobiliaria/core/packages/storage/storage.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: DotenvPlugin.apiUrl,
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    ),
  );

  static bool _interceptorAdded = false;

  /// Agrega interceptor solo una vez para evitar duplicaciones
  static void addAuthInterceptor() {
    if (_interceptorAdded) return;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await KeyValueStorageServiceImpl.instance
              .getValue<String>('token');
          final idEmpresa = await KeyValueStorageServiceImpl.instance
              .getValue<String>('idEmpresa');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          if (idEmpresa != null && idEmpresa.isNotEmpty) {
            options.headers['idEmpresa'] = idEmpresa;
          }
          handler.next(options);
        },
      ),
    );
    _interceptorAdded = true;
  }

  static Dio get dio => _dio;
}
