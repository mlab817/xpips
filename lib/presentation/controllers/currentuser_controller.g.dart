// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currentuser_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurrentUserHash() => r'14d06c0264c85d8fa4513e4c30e959214484455f';

/// See also [getCurrentUser].
@ProviderFor(getCurrentUser)
final getCurrentUserProvider = FutureProvider<UserResponse?>.internal(
  getCurrentUser,
  name: r'getCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCurrentUserRef = FutureProviderRef<UserResponse?>;
String _$currentUserHash() => r'628113e7c64d6dec3dcc9f521768d270975f50db';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = Provider<User?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = ProviderRef<User?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
