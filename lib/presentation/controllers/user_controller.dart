import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:pips/domain/models/user.dart';

class CurrentUserController extends Notifier<User?> {
  User? getUser() {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final userFromSharedPrefs = sharedPreferences.getString('CURRENT_USER');

    print(userFromSharedPrefs);

    return userFromSharedPrefs != null
        ? User.fromJson(jsonDecode(userFromSharedPrefs))
        : null;
  }

  @override
  User? build() => getUser();
}

final currentUserControllerProvider =
    NotifierProvider<CurrentUserController, User?>(() {
  return CurrentUserController();
});
