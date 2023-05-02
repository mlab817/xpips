import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/providers/sharedpreferences.dart';

class SettingsRepository {
  const SettingsRepository(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

// set and get methods
}

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SettingsRepository(sharedPrefs);
});
