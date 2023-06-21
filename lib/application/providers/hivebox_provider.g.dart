// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hivebox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hiveBoxHash() => r'4fc9bfe4d7ee5c8e493e54987296ee376200a981';

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

typedef HiveBoxRef = ProviderRef<Box<FormOptions>>;

/// See also [hiveBox].
@ProviderFor(hiveBox)
const hiveBoxProvider = HiveBoxFamily();

/// See also [hiveBox].
class HiveBoxFamily extends Family<Box<FormOptions>> {
  /// See also [hiveBox].
  const HiveBoxFamily();

  /// See also [hiveBox].
  HiveBoxProvider call({
    required String boxName,
  }) {
    return HiveBoxProvider(
      boxName: boxName,
    );
  }

  @override
  HiveBoxProvider getProviderOverride(
    covariant HiveBoxProvider provider,
  ) {
    return call(
      boxName: provider.boxName,
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
  String? get name => r'hiveBoxProvider';
}

/// See also [hiveBox].
class HiveBoxProvider extends Provider<Box<FormOptions>> {
  /// See also [hiveBox].
  HiveBoxProvider({
    required this.boxName,
  }) : super.internal(
          (ref) => hiveBox(
            ref,
            boxName: boxName,
          ),
          from: hiveBoxProvider,
          name: r'hiveBoxProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hiveBoxHash,
          dependencies: HiveBoxFamily._dependencies,
          allTransitiveDependencies: HiveBoxFamily._allTransitiveDependencies,
        );

  final String boxName;

  @override
  bool operator ==(Object other) {
    return other is HiveBoxProvider && other.boxName == boxName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, boxName.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
