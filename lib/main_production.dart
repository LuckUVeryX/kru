import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/app/app.dart';
import 'package:kru/bootstrap.dart';

void main() {
  bootstrap(() => const ProviderScope(child: App()));
}
