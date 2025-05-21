import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'network/responses/login_response/login_response.dart';

class SessionManager {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveLoginData({
    required String name,
    required String email,
    required String position,
    required String mobile,
    required List<Zones> zones,
  }) async {
    await _storage.write(key: 'name', value: name);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'position', value: position);
    await _storage.write(key: 'mobile', value: mobile);

    // Save List<Zones> as JSON string
    final List<Map<String, dynamic>> zoneList = zones.map((zone) => zone.toJson()).toList();
    await _storage.write(key: 'zones', value: jsonEncode(zoneList));
  }

  static Future<Map<String, dynamic>> getLoginData() async {
    final name = await _storage.read(key: 'name');
    final email = await _storage.read(key: 'email');
    final position = await _storage.read(key: 'position');
    final mobile = await _storage.read(key: 'mobile');
    final zonesString = await _storage.read(key: 'zones');

    List<Zones> zones = [];

    if (zonesString != null) {
      try {
        final List<dynamic> decoded = jsonDecode(zonesString);
        zones = decoded.map((e) => Zones.fromJson(e)).toList();
      } catch (e) {
        print("Error decoding zones: $e");
      }
    }

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

  static Future<void> setZoneId(String id) async {
    await _storage.write(key: 'zone_id', value: id);
  }

  static Future<void> setWardId(String id) async {
    await _storage.write(key: 'ward_id', value: id);
  }

  static Future<String?> getZoneId() async {
    return await _storage.read(key: 'zone_id');
  }

  static Future<String?> getWardId() async {
    return await _storage.read(key: 'ward_id');
  }
}
