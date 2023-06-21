// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginRequestControllerHash() =>
    r'ad6db7d30419838c9f805cd57920d53e4f96f802';

/// See also [LoginRequestController].
@ProviderFor(LoginRequestController)
final loginRequestControllerProvider =
    NotifierProvider<LoginRequestController, LoginRequest>.internal(
  LoginRequestController.new,
  name: r'loginRequestControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginRequestControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginRequestController = Notifier<LoginRequest>;
String _$loginHash() => r'51079476d9ec92429373417261c29eb109dd6cc2';

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
