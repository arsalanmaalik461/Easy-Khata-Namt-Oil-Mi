import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'data/auto_backup.dart';
import 'data/db_path.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    initProductionDb();
    // 24h Drive auto-backup: background scheduler + foreground fallback check.
    await AutoBackup.initialize();
    runApp(const ProviderScope(child: NamtApp()));
    // Foreground fallback — never blocks startup; runs after first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AutoBackup.checkAndRun();
    });
  }, (error, stack) {
    // Never crash silently on startup; surface via FlutterError.
    FlutterError.reportError(FlutterErrorDetails(
      exception: error,
      stack: stack,
      library: 'namt_oil_mil',
    ));
  });
}
