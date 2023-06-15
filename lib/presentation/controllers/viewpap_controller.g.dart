// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewpap_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$futureProjectHash() => r'8ecc20b74f954e8bbd1887898e9f900a21c95041';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FutureProjectRef = FutureProviderRef<ProjectResponse>;

/// See also [futureProject].
@ProviderFor(futureProject)
const futureProjectProvider = FutureProjectFamily();

/// See also [futureProject].
class FutureProjectFamily extends Family<AsyncValue<ProjectResponse>> {
  /// See also [futureProject].
  const FutureProjectFamily();

  /// See also [futureProject].
  FutureProjectProvider call({
    required String uuid,
  }) {
    return FutureProjectProvider(
      uuid: uuid,
    );
  }

  @override
  FutureProjectProvider getProviderOverride(
    covariant FutureProjectProvider provider,
  ) {
    return call(
      uuid: provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'futureProjectProvider';
}

/// See also [futureProject].
class FutureProjectProvider extends FutureProvider<ProjectResponse> {
  /// See also [futureProject].
  FutureProjectProvider({
    required this.uuid,
  }) : super.internal(
          (ref) => futureProject(
            ref,
            uuid: uuid,
          ),
          from: futureProjectProvider,
          name: r'futureProjectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$futureProjectHash,
          dependencies: FutureProjectFamily._dependencies,
          allTransitiveDependencies:
              FutureProjectFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is FutureProjectProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
