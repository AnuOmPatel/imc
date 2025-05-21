import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveLoginData({
    required String name,
    required String email,
    required String position,
    required String mobile,

    required String zonesJson,
  }) async {

    print("session data ${name} ${email} ${position} ${name}, $zonesJson");

    await _storage.write(key: 'name', value: name);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'position', value: position);
    await _storage.write(key: 'mobile', value: mobile);
    await _storage.write(key: 'zones', value: zonesJson);
  }

  static Future<Map<String, String?>> getLoginData() async {
    final name = await _storage.read(key: 'name');
    final email = await _storage.read(key: 'email');
    final position = await _storage.read(key: 'position');
    final mobile = await _storage.read(key: 'mobile');
    final zones = await _storage.read(key: 'zones');
    return {
      'full_name': name,
      'email': email,
      'position': position,
      'mobile_no': mobile,
      'zones': zones,
    };
  }

  static Future<void> clearSession() async {
    await _storage.deleteAll();
  }
}
