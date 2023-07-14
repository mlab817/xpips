// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactivationrequest_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$requestReactivationHash() =>
    r'9d33ca3d48f66e4d2ec8f14dd87c68516edce152';

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
    r'8b392faced2fc36f0f19226b50063f9aea4b02de';

/// See also [ReactivationRequestController].
@ProviderFor(ReactivationRequestController)
final reactivationRequestControllerProvider = NotifierProvider<
    ReactivationRequestController, ReactivationRequest>.internal(
  ReactivationRequestController.new,
  name: r'reactivationRequestControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reactivationRequestControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReactivationRequestController = Notifier<ReactivationRequest>;
String _$reactivationFileUploadControllerHash() =>
    r'0d3915dd4a876fd70bd1cd98b49d098a319c828f';

/// See also [ReactivationFileUploadController].
@ProviderFor(ReactivationFileUploadController)
final reactivationFileUploadControllerProvider =
    AutoDisposeAsyncNotifierProvider<ReactivationFileUploadController,
        UploadResponse?>.internal(
  ReactivationFileUploadController.new,
  name: r'reactivationFileUploadControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reactivationFileUploadControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReactivationFileUploadController
    = AutoDisposeAsyncNotifier<UploadResponse?>;
String _$requestReactivationControllerHash() =>
    r'c956ee8f2bbfdf2a93604469f6f25afe3d3f5f45';

/// See also [RequestReactivationController].
@ProviderFor(RequestReactivationController)
final requestReactivationControllerProvider = AsyncNotifierProvider<
    RequestReactivationController, ReactivationResponse>.internal(
  RequestReactivationController.new,
  name: r'requestReactivationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestReactivationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RequestReactivationController = AsyncNotifier<ReactivationResponse>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
