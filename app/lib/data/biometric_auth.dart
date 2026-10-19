import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

import '../core/result.dart';

/// Fingerprint / biometric authentication backend.
///
/// Used to gate the app (in addition to / instead of the PIN) — the UI
/// (Team A) owns the toggle and prompt placement; this service owns the
/// platform capability checks and the authenticate() call.
class BiometricAuthService {
  final LocalAuthentication _auth = LocalAuthentication();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const _kEnabledKey = 'biometric_enabled';

  /// True when the device can do biometric auth (hardware + enrolled).
  Future<bool> get canUseBiometrics async {
    try {
      final canCheck = await _auth.canCheckBiometrics;
      final available = await _auth.isDeviceSupported();
      if (!canCheck || !available) return false;
      final enrolled = await _auth.getAvailableBiometrics();
      return enrolled.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Whether the user enabled biometric unlock in settings.
  Future<bool> get isEnabled async =>
      (await _storage.read(key: _kEnabledKey)) == '1';

  Future<void> setEnabled(bool enabled) async {
    await _storage.write(
        key: _kEnabledKey, value: enabled ? '1' : '0');
  }

  /// Shows the system biometric prompt. Returns Ok(true) on success.
  Future<Result<bool>> authenticate({required String reason}) async {
    try {
      final ok = await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      return Ok(ok);
    } catch (e) {
      return Err('Biometric authentication failed: $e');
    }
  }
}
