import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeRefX<T> on AutoDisposeRef<T> {
  /// Caches the value provided by Future/Stream providers for [duration].
  void cache([Duration duration = const Duration(seconds: 30)]) {
    Timer? timer;
    final link = keepAlive();

    // When the provider is destroyed, cancel the timer
    onDispose(() => timer?.cancel());
    // When the last listener is removed, start a timer to dispose the cached data
    onCancel(() => timer = Timer(duration, link.close));
    // If the provider is listened again after it was paused, cancel the timer
    onResume(() => timer?.cancel());
  }
}
