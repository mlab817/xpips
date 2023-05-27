import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'sharedpreferences.dart';

part 'bearertoken_provider.g.dart';

@Riverpod(keepAlive: true)
class BearerToken extends _$BearerToken {
  /// Set token explicitly when logging in
  void setToken(String token) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);

    // save the token to shared prefs
    sharedPrefs.setString('BEARER_TOKEN', token);

    // set the token to the state
    state = token;
  }

  // Retrieve the token on page refresh
  String? getTokenFromSharedPrefs() =>
      ref.watch(sharedPreferencesProvider).getString('BEARER_TOKEN');

  @override
  String? build() => getTokenFromSharedPrefs();
}
