import 'package:shared_preferences/shared_preferences.dart';

class LocalSourceKey {
  static const deviceId = 'device_id';
  static const hasProfile = 'has_profile';
  static const accessToken = 'access_token';
  static const uuid = 'user_uid';
}

class LocalSource {
  final SharedPreferences prefes;

  LocalSource(this.prefes);

  Future<void> setTokens(String token) async {
    await prefes.setBool(LocalSourceKey.hasProfile, true);
    await prefes.setString(LocalSourceKey.accessToken, token);
  }

  String get getAccessToken =>
      prefes.getString(LocalSourceKey.accessToken) ?? '';
  String get getUuid => prefes.getString(LocalSourceKey.uuid) ?? '';

  bool get getHasProfile => prefes.getBool(LocalSourceKey.hasProfile) ?? false;

  Future<void> setDeviceId(String deviceId) async {
    await prefes.setString(LocalSourceKey.deviceId, deviceId);
  }

  Future<void> setUuid(String uuid) async {
    await prefes.setString(LocalSourceKey.uuid, uuid);
  }

  String get getDeviceId => prefes.getString(LocalSourceKey.deviceId) ?? '';

  /// Clear Profile
  Future<void> clearProfile() async {
    await prefes.remove(LocalSourceKey.hasProfile);
    await prefes.remove(LocalSourceKey.accessToken);
    await prefes.remove(LocalSourceKey.uuid);
  }
}
