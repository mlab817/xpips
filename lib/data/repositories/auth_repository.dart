import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/functions.dart';
import '../../application/providers/appserviceclient_provider.dart';
import '../../application/providers/sharedpreferences.dart';
import '../../data/data_sources/app_service_client.dart';
import '../../data/requests/requests.dart';
import '../../domain/entities/user.dart';
import '../requests/fcm_request.dart';
import '../requests/login_request.dart';
import '../responses/responses.dart';

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

  Future<void> updateFcmToken(FcmRequest request);

  Future<ForgotPasswordResponse> forgotPassword(String email);

  Future<ValidateEmailResponse> validateEmail(String email);
}

class AuthRepositoryImplementer implements AuthRepository {
  final AppServiceClient client;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImplementer(
      {required this.client, required this.sharedPreferences});

  @override
  Future<LoginResponse> login(LoginRequest input) async {
    try {
      return await client.login(input);
    } catch (e) {
      throw (formatError(e));
    }
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
    try {
      return await client.signup(request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ReactivationResponse> requestReactivation(
      ReactivationRequest request) async {
    try {
      return await client.requestReactivation(request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<UpdateProfileResponse> updateProfile(
      UpdateProfileRequest request) async {
    try {
      return await client.updateProfile(request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  void setUser(User user) {
    sharedPreferences.setString('CURRENT_USER', jsonEncode(user));
  }

  @override
  Future<void> updateFcmToken(FcmRequest request) async {
    try {
      return await client.updateFcmToken(request);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    try {
      return await client.forgotPassword(email);
    } catch (e) {
      throw formatError(e);
    }
  }

  @override
  Future<ValidateEmailResponse> validateEmail(String email) async {
    try {
      return await client.validateEmail(email);
    } catch (e) {
      throw formatError(e);
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepositoryImplementer(
      client: ref.watch(appServiceClientProvider),
      sharedPreferences: ref.watch(sharedPreferencesProvider),
    );
