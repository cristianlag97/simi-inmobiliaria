import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvPlugin {
  DotenvPlugin._();

  static Future<void> initialize() async {
    const envFile = String.fromEnvironment('ENV', defaultValue: '.env');
    await dotenv.load(fileName: envFile);
  }

  static String apiUrl =
      dotenv.env['API_URL'] ?? 'No está configurada el API_URL';
  static String mapboxApiKey = dotenv.env['MAPBOX_API_KEY'] ?? 'no-api-key';
}
