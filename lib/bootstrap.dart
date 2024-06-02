import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/database/database.dart';
import 'package:kru/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runApp(
    ProviderScope(
      observers: const [LogObserver()],
      overrides: [
        preferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: await builder(),
    ),
  );
}
