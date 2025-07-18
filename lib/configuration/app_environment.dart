// lib/configuration/app_environment.dart ;;
import 'package:dekul_connect_app/resources/resources.dart';

class AppEnvironment {
  static Map<String, String> get env => <String, String>{
    EnvironmentConstant.apiUrl: const String.fromEnvironment(
      EnvironmentConstant.apiUrl,
    ),
  };

  // BASE URL
  static String get apiUrl => env[EnvironmentConstant.apiUrl] ?? '';
  // Hasil: "http://54.251.244.23/api/??endpoint di constant"
}
