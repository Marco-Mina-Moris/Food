import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageKeys {
  static const String onboarding = 'onboarding';
  static const String role = 'role';
}

class SecureStorageHelper {
  static const _storage = FlutterSecureStorage();

  // Onboarding Status
  static Future<void> setOnboardingCompleted(bool completed) async {
    await _storage.write(
      key: SecureStorageKeys.onboarding,
      value: completed ? 'true' : 'false',
    );
  }

  static Future<bool> isOnboardingCompleted() async {
    final val = await _storage.read(key: SecureStorageKeys.onboarding);
    return val == 'true';
  }

  // Active Role
  static Future<void> setRole(String role) async {
    await _storage.write(key: SecureStorageKeys.role, value: role);
  }

  static Future<String> getRole() async {
    final val = await _storage.read(key: SecureStorageKeys.role);
    return val ?? 'User';
  }

  static Future<void> clearRole() async {
    await _storage.delete(key: SecureStorageKeys.role);
  }

  // Clear All
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
