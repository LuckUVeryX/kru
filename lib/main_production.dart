import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/app/app.dart';
import 'package:kru/bootstrap.dart';
import 'package:kru/utils/utils.dart';

void main() {
  bootstrap(
    () => const ProviderScope(
      observers: [LogObserver()],
      child: App(),
    ),
  );
}
