import 'package:flutter/material.dart';
import 'package:kru/l10n/l10n.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const light = Color(0xFFEDE8DE);
    const dark = Color(0xFF211E1C);

    return MaterialApp(
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: dark,
          onPrimary: light,
          secondary: dark,
          onSecondary: light,
          surface: light,
          onSurface: dark,
          surfaceTint: light,
          error: context.colorScheme.error,
          onError: context.colorScheme.onError,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const RootPage(),
    );
  }
}
