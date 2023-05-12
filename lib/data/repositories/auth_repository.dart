import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/providers/sharedpreferences.dart';
import 'package:pips/data/data_sources/app_service_client.dart';
import 'package:pips/data/requests/signup_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/login_credentials.dart';
import '../../domain/models/login_response.dart';
import '../../domain/models/user.dart';
import '../responses/signup_response.dart';

// see https://codewithandrea.com/articles/flutter-presentation-layer/

abstract class AuthRepository {
  Future<LoginResponse> login(LoginCredentials input);

  Future<void> signOut();

  User? getUser();

  User? get currentUser;

  Future<SignupResponse> signup(SignupRequest request);
}

class AuthRepositoryImplementer implements AuthRepository {
  final AppServiceClient client;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImplementer(
      {required this.client, required this.sharedPreferences});

  @override
  Future<LoginResponse> login(LoginCredentials input) async {
    return await client.login(input);
  }

  @override
  Future<void> signOut() {
    // TODO: sign out
    throw UnimplementedError();
  }

  @override
  User? getUser() {
    var userFromSharedPrefs = sharedPreferences.getString('CURRENT_USER');

    if (userFromSharedPrefs != null) {
      return User.fromJson(jsonDecode(userFromSharedPrefs));
    }

    return null;
  }

  @override
  User? get currentUser => throw UnimplementedError();

  @override
  Future<SignupResponse> signup(SignupRequest request) async {
    return client.signup(request);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImplementer(
    client: ref.watch(appServiceClientProvider),
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  );
});

// controls login screen
class LoginScreenController extends StateNotifier<AsyncValue<void>> {
  LoginScreenController({required this.authRepository})
      : super(const AsyncData<void>(null));

  final AuthRepository authRepository;

  Future<void> login(LoginCredentials input) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() => authRepository.login(input));
  }
}

final loginScreenControllerProvider =
StateNotifierProvider.autoDispose<LoginScreenController, AsyncValue<void>>(
        (ref) {
      return LoginScreenController(
          authRepository: ref.watch(authRepositoryProvider));
    });
