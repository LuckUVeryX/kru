import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension BuildContextX on BuildContext {
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  ShadThemeData get theme => ShadTheme.of(this);
  ShadTextTheme get textTheme => theme.textTheme;
  ShadColorScheme get colorScheme => theme.colorScheme;
}
