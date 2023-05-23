import 'dart:convert';

import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/models.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  User? getCurrentUser() {
    final userFromSharedPrefs =
        ref.watch(sharedPreferencesProvider).getString('CURRENT_USER');

    return userFromSharedPrefs != null
        ? User.fromJson(jsonDecode(userFromSharedPrefs))
        : null;
  }

  void setCurrentUser(User user) {
    state = user;
  }

  Future<void> logout() async {
    state = null;
  }

  @override
  User? build() {
    return getCurrentUser();
  }
}
