import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/providers/appserviceclient_provider.dart';
import '../../application/providers/sharedpreferences.dart';
import '../../data/data_sources/app_service_client.dart';
import '../../data/requests/requests.dart';
import '../../domain/models/user.dart';
import '../requests/login_request.dart';
import '../responses/login_response.dart';
import '../responses/reactivation_response.dart';
import '../responses/signup_response.dart';
import '../responses/updateprofile_response.dart';

part 'auth_repository.g.dart';

// see https://codewithandrea.com/articles/flutter-presentation-layer/

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest input);

  Future<void> signOut();

  User? getUser();

  User? get currentUser;

  void setUser(User user);

  Future<SignupResponse> signup(SignupRequest request);

  Future<ReactivationResponse> requestReactivation(ReactivationRequest request);

  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request);
}

class AuthRepositoryImplementer implements AuthRepository {
  final AppServiceClient client;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImplementer(
      {required this.client, required this.sharedPreferences});

  @override
  Future<LoginResponse> login(LoginRequest input) async {
    return await client.login(input);
  }

  @override
  Future<void> signOut() {
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

  @override
  Future<ReactivationResponse> requestReactivation(
      ReactivationRequest request) async {
    return client.requestReactivation(request);
  }

  @override
  Future<UpdateProfileResponse> updateProfile(
      UpdateProfileRequest request) async {
    return client.updateProfile(request);
  }

  @override
  void setUser(User user) {
    sharedPreferences.setString('CURRENT_USER', jsonEncode(user));
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepositoryImplementer(
      client: ref.watch(appServiceClientProvider),
      sharedPreferences: ref.watch(sharedPreferencesProvider),
    );
