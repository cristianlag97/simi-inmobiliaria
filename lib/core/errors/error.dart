import 'package:dio/dio.dart';

enum FetchCustomError { notFound, serverError, unknown, withoutInternet }

class CustomError implements Exception {
  final String message;
  final FetchCustomError error;

  CustomError(this.message, this.error);

  @override
  String toString() => 'FetchCustomException: $message';
}

class FetchException {
  const FetchException._();

  /// Lanza una excepción personalizada con un mensaje y tipo de error definido.
  ///
  /// [fetchCustomError] Tipo de error predefinido.
  /// [message] Descripción legible del error.
  static CustomError onCatchError({
    required FetchCustomError fetchCustomError,
    required String message,
  }) {
    throw CustomError(message, fetchCustomError);
  }

  /// Maneja las excepciones generadas por la librería Dio y las transforma
  /// en errores definidos por el dominio para su uso dentro de la app.
  ///
  /// Permite capturar errores como timeout de conexión, errores de autenticación,
  /// respuestas inválidas u otros errores desconocidos.
  ///
  /// [e] Excepción capturada de Dio.
  ///
  /// Retorna una excepción específica basada en el código de estado HTTP o tipo de error.
  static Exception handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return CustomError(
        'Revisar conexión a internet',
        FetchCustomError.withoutInternet,
      );
    }

    final status = e.response?.statusCode ?? 0;

    switch (status) {
      case 401:
        return onCatchError(
          fetchCustomError: FetchCustomError.notFound,
          message: 'Credenciales incorrectas',
        );
      case 404:
        return onCatchError(
          fetchCustomError: FetchCustomError.notFound,
          message: 'Recurso no encontrado',
        );
      case 500:
        return onCatchError(
          fetchCustomError: FetchCustomError.serverError,
          message: 'Error interno del servidor',
        );
      default:
        return onCatchError(
          fetchCustomError: FetchCustomError.unknown,
          message: 'Error inesperado: ${e.message}',
        );
    }
  }
}
