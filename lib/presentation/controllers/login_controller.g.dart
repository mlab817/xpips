// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginCredentialsControllerHash() =>
    r'f08785809d67192d22a44c160a4f0d83c4c5db51';

/// See also [LoginCredentialsController].
@ProviderFor(LoginCredentialsController)
final loginCredentialsControllerProvider =
    NotifierProvider<LoginCredentialsController, LoginCredentials>.internal(
  LoginCredentialsController.new,
  name: r'loginCredentialsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginCredentialsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginCredentialsController = Notifier<LoginCredentials>;
String _$loginHash() => r'420f73a8ab8121bdb8687ab12beabd2a00fd86e6';

/// See also [Login].
@ProviderFor(Login)
final loginProvider = AsyncNotifierProvider<Login, LoginResponse?>.internal(
  Login.new,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Login = AsyncNotifier<LoginResponse?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
