import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpips/application/providers/dio_factory.dart';
import 'package:xpips/application/providers/sharedpreferences.dart';
import 'package:xpips/data/data_sources/network.dart';
import 'package:xpips/domain/models/login_credentials.dart';

import '../../domain/models/user.dart';

class AuthController extends ChangeNotifier {
  AuthController(this.ref, this.sharedPreferences, this.client);

  final Ref ref;
  final SharedPreferences sharedPreferences;
  final AppServiceClient client;

  User? user;

  bool get isLoggedIn => user != null;

  Future<void> login(LoginCredentials input) async {
    final response = await client.login(input);

    final newUser = response.user;
    final accessToken = response.accessToken;

    sharedPreferences.setString('USER', jsonEncode(newUser));

    // set token
    sharedPreferences.setString('BEARER_TOKEN', accessToken);

    // get dio again after loing to load token
    ref.read(dioFactoryProvider).getDio();

    setUser(newUser);

    notifyListeners();
  }

  void setUser(User newUser) {
    user = newUser;
  }

  User? getUser() {
    final userFromSharedPrefs = sharedPreferences.getString('USER');

    return user != null
        ? User.fromJson(jsonDecode(userFromSharedPrefs!))
        : null;
  }

  Future<void> logout() async {
    user = null;

    notifyListeners();
  }
}

final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  final client = ref.watch(appServiceClientProvider);

  return AuthController(ref, sharedPrefs, client);
});

final currentUserProvider = Provider<User?>((ref) {
  final authController = ref.watch(authControllerProvider);

  final user = authController.getUser();

  return user;
});
