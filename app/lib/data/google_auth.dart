import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/result.dart';
import 'db.dart';

/// Google account connection for Drive backup.
///
/// This is NOT an app login — the app stays offline-first and PIN-gated.
/// The Google account is used solely to authorize Google Drive uploads.
///
/// NOTE (release builds): the SHA-1 fingerprint registered in the Google
/// Cloud OAuth client MUST be the release keystore's SHA-1, otherwise
/// sign-in fails on the installed APK. See BUILD_GUIDE.md.
class GoogleAuthService {
  final AppDatabase db;
  final GoogleSignIn _signIn;
  final FlutterSecureStorage _storage;

  static const _kEmailKey = 'google_account_email';

  GoogleAuthService(this.db)
      : _signIn = GoogleSignIn(
          scopes: const [
            'email',
            'https://www.googleapis.com/auth/drive.file',
          ],
        ),
        _storage = const FlutterSecureStorage();

  /// The currently signed-in account, or null.
  GoogleSignInAccount? get currentAccount => _signIn.currentUser;

  /// Attempt a silent sign-in (no UI) on startup.
  Future<GoogleSignInAccount?> signInSilently() async {
    try {
      final account = await _signIn.signInSilently();
      if (account != null) await _persistAccount(account);
      return account;
    } catch (_) {
      return null;
    }
  }

  /// Interactive sign-in. Shows the Google account chooser.
  Future<Result<GoogleSignInAccount>> signIn() async {
    try {
      final account = await _signIn.signIn();
      if (account == null) {
        return const Err('Sign-in cancelled');
      }
      await _persistAccount(account);
      return Ok(account);
    } catch (e) {
      return Err('Google sign-in failed: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _signIn.signOut();
    } catch (_) {
      // Best effort; still clear local state.
    }
    await _storage.delete(key: _kEmailKey);
    await _clearBackupSettingsEmail();
  }

  /// Email of the linked account, from local storage (fast, offline).
  Future<String> linkedEmail() async =>
      (await _storage.read(key: _kEmailKey)) ?? '';

  Future<bool> get isLinked async => (await linkedEmail()).isNotEmpty;

  Future<void> _persistAccount(GoogleSignInAccount account) async {
    await _storage.write(key: _kEmailKey, value: account.email);
    final now = DateTime.now().millisecondsSinceEpoch;
    await (db.update(db.backupSettings)..where((t) => t.id.equals(1))).write(
      BackupSettingsCompanion(
        googleAccountEmail: Value(account.email),
        updatedAt: Value(now),
      ),
    );
  }

  Future<void> _clearBackupSettingsEmail() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (db.update(db.backupSettings)..where((t) => t.id.equals(1))).write(
      BackupSettingsCompanion(
        googleAccountEmail: const Value(''),
        autoBackupEnabled: const Value(0),
        updatedAt: Value(now),
      ),
    );
  }

  GoogleSignIn get rawSignIn => _signIn;
}
