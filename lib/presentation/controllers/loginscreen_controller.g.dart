// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginscreen_controller.dart';

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
String _$loginControllerHash() => r'323800896ffd6e04e026912082a76a7e6fd0733c';

/// See also [LoginController].
@ProviderFor(LoginController)
final loginControllerProvider =
    AutoDisposeAsyncNotifierProvider<LoginController, LoginResponse>.internal(
  LoginController.new,
  name: r'loginControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginController = AutoDisposeAsyncNotifier<LoginResponse>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
