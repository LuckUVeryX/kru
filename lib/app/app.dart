import 'package:flutter/material.dart';
import 'package:kru/l10n/l10n.dart';
import 'package:kru/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const RootPage(),
    );
  }
}
