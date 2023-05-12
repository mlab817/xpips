import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/sharedpreferences.dart';

import '../../domain/models/user.dart';

class AuthController extends Notifier<User?> {
  AuthController() : super();

  User? user;

  bool get isLoggedIn => user != null;

  void setCurrentUser(User newUser) {
    user = newUser;
  }

  User? getCurrentUser() {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final userFromSharedPrefs = sharedPreferences.getString('CURRENT_USER');

    return userFromSharedPrefs != null
        ? User.fromJson(jsonDecode(userFromSharedPrefs))
        : null;
  }

  Future<void> logout() async {
    user = null;
  }

  @override
  User? build() {
    return getCurrentUser();
  }
}

final authControllerProvider = NotifierProvider<AuthController, User?>(() {
  return AuthController();
});
