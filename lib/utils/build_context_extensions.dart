import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}
