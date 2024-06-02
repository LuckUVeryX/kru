import 'package:collection/collection.dart';
import 'package:kru/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'kru_pref_dao.g.dart';

@riverpod
KruPrefDao kruPrefDao(KruPrefDaoRef ref) {
  return KruPrefDao(ref.watch(preferencesProvider));
}

class KruPrefDao {
  const KruPrefDao(this.preferences);

  final SharedPreferences preferences;

  static const kLocation = 'location';
  KruLocation get location {
    return KruLocation.values.firstWhereOrNull(
          (e) => e.name == preferences.getString(kLocation),
        ) ??
        KruLocation.cq;
  }

  set location(KruLocation location) {
    preferences.setString(kLocation, location.name);
  }

  static const kDuration = 'duration';
  int get duration {
    return preferences.getInt(kDuration) ?? 2 * 60;
  }

  set duration(int duration) {
    preferences.setInt(kDuration, duration);
  }
}
