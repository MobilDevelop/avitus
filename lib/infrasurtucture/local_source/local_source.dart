import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSource {
  static var box = Hive.box("Mymemory");

  static Future<void> setDeviceId(String deviceId) async {
    await box.put('userKey', deviceId);
  }

  static Future<String> getDeviceId() async {
    String userKey = await box.get('userKey') ?? '';
    return userKey;
  }

  /// Clear Profile
  static Future<void> clearProfile() async {
    await box.clear();
  }
}
