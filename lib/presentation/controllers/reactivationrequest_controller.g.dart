// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactivationrequest_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$requestReactivationHash() =>
    r'adea2cf32e571c75ddb7bd705bb255b2e7f1b437';

/// See also [requestReactivation].
@ProviderFor(requestReactivation)
final requestReactivationProvider =
    AutoDisposeFutureProvider<ReactivationResponse>.internal(
  requestReactivation,
  name: r'requestReactivationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestReactivationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RequestReactivationRef
    = AutoDisposeFutureProviderRef<ReactivationResponse>;
String _$reactivationRequestControllerHash() =>
    r'3c9aedbe51b7b6d78a3d4e2b105655fd8d565320';

/// See also [ReactivationRequestController].
@ProviderFor(ReactivationRequestController)
final reactivationRequestControllerProvider = AutoDisposeNotifierProvider<
    ReactivationRequestController, ReactivationRequest>.internal(
  ReactivationRequestController.new,
  name: r'reactivationRequestControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reactivationRequestControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReactivationRequestController
    = AutoDisposeNotifier<ReactivationRequest>;
String _$reactivationFileUploadControllerHash() =>
    r'f965c76d6d418bf79f6eab48c070df1d37da19c1';

/// See also [ReactivationFileUploadController].
@ProviderFor(ReactivationFileUploadController)
final reactivationFileUploadControllerProvider =
    AutoDisposeAsyncNotifierProvider<ReactivationFileUploadController,
        UploadResponse>.internal(
  ReactivationFileUploadController.new,
  name: r'reactivationFileUploadControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reactivationFileUploadControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReactivationFileUploadController
    = AutoDisposeAsyncNotifier<UploadResponse>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
