import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:pips/presentation/controllers/controllers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/models.dart';

part 'currentuser_controller.g.dart';

@Riverpod(keepAlive: true)
User? currentUser(CurrentUserRef ref) {
  final loginResponse = ref.watch(loginProvider).value;

  if (kDebugMode) {
    print('currentUser provider triggered');
  }

  if (loginResponse?.user != null) {
    print('currentUser is not null');
    ref
        .watch(sharedPreferencesProvider)
        .setString('CURRENT_USER', jsonEncode(loginResponse!.user));
  }

  final userFromSharedPrefs =
      ref.watch(sharedPreferencesProvider).getString('CURRENT_USER');

  return userFromSharedPrefs != null
      ? User.fromJson(jsonDecode(userFromSharedPrefs))
      : null;
}
