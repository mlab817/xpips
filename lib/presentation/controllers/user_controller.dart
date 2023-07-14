import 'dart:convert';

import '../../application/providers/sharedpreferences.dart';
import '../../domain/entities/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserController extends _$CurrentUserController {
  User? getUser() {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final userFromSharedPrefs = sharedPreferences.getString('CURRENT_USER');

    return userFromSharedPrefs != null
        ? User.fromJson(jsonDecode(userFromSharedPrefs))
        : null;
  }

  @override
  User? build() => getUser();
}
