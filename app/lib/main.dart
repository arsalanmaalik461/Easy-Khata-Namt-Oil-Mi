import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'data/db_path.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    initProductionDb();
    runApp(const ProviderScope(child: NamtApp()));
  }, (error, stack) {
    // Never crash silently on startup; surface via FlutterError.
    FlutterError.reportError(FlutterErrorDetails(
      exception: error,
      stack: stack,
      library: 'namt_oil_mil',
    ));
  });
}
