// lib/core/common/shared_helpers.dart
import 'package:encrypt_shared_preferences/provider.dart';

class SharedPrefs {
  static Future<EncryptedSharedPreferences> init() async {
    await EncryptedSharedPreferences.initialize('3748264739482747');
    return EncryptedSharedPreferences.getInstance();
  }

  static String? getString(String name) {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    return prefs.getString(name);
  }

  static Future<void> setString(String name, String content) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    await prefs.setString(name, content);
  }

  static int? getInt(String name) {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    return prefs.getInt(name);
  }

  static Future<void> setInt(String name, int content) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    await prefs.setInt(name, content);
  }

  static double? getDouble(String name) {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    return prefs.getDouble(name);
  }

  static Future<void> setDouble(String name, double content) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    await prefs.setDouble(name, content);
  }

  static bool? getBool(String name) {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    return prefs.getBoolean(name);
  }

  static Future<void> setBool(String name, bool content) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    await prefs.setBoolean(name, content);
  }

  static Future<void> remove(String name) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences.getInstance();

    await prefs.remove(name);
  }
}
