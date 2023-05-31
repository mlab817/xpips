// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupscreen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signupRequestControllerHash() =>
    r'89c861fc56798f3a44cde68cd3c75c93614825b9';

/// See also [SignupRequestController].
@ProviderFor(SignupRequestController)
final signupRequestControllerProvider =
    NotifierProvider<SignupRequestController, SignupRequest>.internal(
  SignupRequestController.new,
  name: r'signupRequestControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signupRequestControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignupRequestController = Notifier<SignupRequest>;
String _$signupControllerHash() => r'6a74bf1db0acc7a7fd34156cd6655f9751de3aed';

/// See also [SignupController].
@ProviderFor(SignupController)
final signupControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignupController, void>.internal(
  SignupController.new,
  name: r'signupControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signupControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignupController = AutoDisposeAsyncNotifier<void>;
String _$authorizationFileUploadControllerHash() =>
    r'0f57badfbd41538238fe77309b11c61190fe7c14';

/// See also [AuthorizationFileUploadController].
@ProviderFor(AuthorizationFileUploadController)
final authorizationFileUploadControllerProvider = AsyncNotifierProvider<
    AuthorizationFileUploadController, UploadResponse?>.internal(
  AuthorizationFileUploadController.new,
  name: r'authorizationFileUploadControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authorizationFileUploadControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthorizationFileUploadController = AsyncNotifier<UploadResponse?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
