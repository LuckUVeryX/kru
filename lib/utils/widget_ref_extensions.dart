import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefX on WidgetRef {
  void listenError<T>(ProviderListenable<AsyncValue<T>> provider) {
    return listen(
      provider,
      (previous, next) {
        return next.whenOrNull(
          error: (e, _) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString())),
            );
          },
        );
      },
    );
  }
}
