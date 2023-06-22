// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onesignal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onesignalHash() => r'80d56e85927a411f9d2a0b02824291c2c875edb7';

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

typedef OnesignalRef = FutureProviderRef<void>;

/// See also [onesignal].
@ProviderFor(onesignal)
const onesignalProvider = OnesignalFamily();

/// See also [onesignal].
class OnesignalFamily extends Family<AsyncValue<void>> {
  /// See also [onesignal].
  const OnesignalFamily();

  /// See also [onesignal].
  OnesignalProvider call({
    required BuildContext context,
  }) {
    return OnesignalProvider(
      context: context,
    );
  }

  @override
  OnesignalProvider getProviderOverride(
    covariant OnesignalProvider provider,
  ) {
    return call(
      context: provider.context,
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
  String? get name => r'onesignalProvider';
}

/// See also [onesignal].
class OnesignalProvider extends FutureProvider<void> {
  /// See also [onesignal].
  OnesignalProvider({
    required this.context,
  }) : super.internal(
          (ref) => onesignal(
            ref,
            context: context,
          ),
          from: onesignalProvider,
          name: r'onesignalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onesignalHash,
          dependencies: OnesignalFamily._dependencies,
          allTransitiveDependencies: OnesignalFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is OnesignalProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$oneSignalControllerHash() =>
    r'1ee45bfe98c161e457386bbf1b332cf9ba7491e3';

/// See also [oneSignalController].
@ProviderFor(oneSignalController)
final oneSignalControllerProvider = FutureProvider<void>.internal(
  oneSignalController,
  name: r'oneSignalControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$oneSignalControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OneSignalControllerRef = FutureProviderRef<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
