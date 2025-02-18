import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get dbName => dotenv.env['DB_NAME'] ?? '';
  static String get dbPath => dotenv.env['DB_PATH'] ?? '';
  static String get dbAssetPath => dotenv.env['DB_ASSET_PATH'] ?? '';
  static String get appName => dotenv.env['APP_NAME'] ?? '';
}
