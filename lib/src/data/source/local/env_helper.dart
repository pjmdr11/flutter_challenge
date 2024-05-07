import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@singleton
class EnvHelper {
  dynamic getEnvData(String key, {def = ""}) {
    return dotenv.env[key] ?? def;
  }
}
