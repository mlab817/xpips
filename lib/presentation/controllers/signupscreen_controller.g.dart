// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupscreen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signupRequestControllerHash() =>
    r'16e6c66d027a2ceaca2f900454de4cdae1a64135';

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
String _$signupControllerHash() => r'956848464a190a32d3bea6dc11f4a8875485505b';

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
    r'5a6f9ff17f162ee998274442a299f681d728969f';

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
