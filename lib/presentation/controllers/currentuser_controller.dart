import 'dart:convert';

import 'package:pips/application/providers/appserviceclient_provider.dart';
import 'package:pips/application/providers/bearertoken_provider.dart';
import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:pips/data/responses/user_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/models.dart';

part 'currentuser_controller.g.dart';

@Riverpod(keepAlive: true)
Future<UserResponse?> getCurrentUser(GetCurrentUserRef ref) async {
  // listen to login provider
  final bearerToken = ref.watch(bearerTokenProvider);

  // if bearer token is not null, this means the user has logged in
  if (bearerToken != null) {
    final client = ref.watch(appServiceClientProvider);

    final user = await client.getCurrentUser();

    // save to shared preferences
    ref
        .watch(sharedPreferencesProvider)
        .setString('CURRENT_USER', jsonEncode(user.user));

    return user;
  } else {
    return null;
  }
}

@Riverpod(keepAlive: true)
User? currentUser(CurrentUserRef ref) {
  // retrieve current user
  return ref.watch(getCurrentUserProvider).value?.user;
}
