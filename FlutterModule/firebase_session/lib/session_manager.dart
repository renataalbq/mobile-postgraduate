import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveSessionToken(String token) async {
    await _storage.write(key: 'session_token', value: token);
  }

  static Future<String?> getSessionToken() async {
    return await _storage.read(key: 'session_token');
  }

  static Future<void> clearSession() async {
    await _storage.delete(key: 'session_token');
  }
}