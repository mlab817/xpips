import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/sharedpreferences.dart';

class BearerToken extends Notifier<String?> {
  /// Set token explicitly when logging in
  void setToken(String token) {
    // save the token to shared prefs
    final sharedPrefs = ref.watch(sharedPreferencesProvider);

    sharedPrefs.setString('BEARER_TOKEN', token);

    // set the token to the state
    state = token;
  }

  // Retrieve the token on page refresh
  String? getTokenFromSharedPrefs() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);

    return sharedPrefs.getString('BEARER_TOKEN');
  }

  @override
  String? build() {
    return getTokenFromSharedPrefs();
  }
}

final bearerTokenNotifierProvider = NotifierProvider<BearerToken, String?>(() {
  return BearerToken();
});
