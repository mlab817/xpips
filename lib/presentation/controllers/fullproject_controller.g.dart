// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullproject_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fullProjectControllerHash() =>
    r'6cc9efb539b4a608833fc368f4f9afa7f8e58ffb';

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

abstract class _$FullProjectController extends BuildlessNotifier<FullProject> {
  late final String uuid;

  FullProject build(
    String uuid,
  );
}

/// See also [FullProjectController].
@ProviderFor(FullProjectController)
const fullProjectControllerProvider = FullProjectControllerFamily();

/// See also [FullProjectController].
class FullProjectControllerFamily extends Family<FullProject> {
  /// See also [FullProjectController].
  const FullProjectControllerFamily();

  /// See also [FullProjectController].
  FullProjectControllerProvider call(
    String uuid,
  ) {
    return FullProjectControllerProvider(
      uuid,
    );
  }

  @override
  FullProjectControllerProvider getProviderOverride(
    covariant FullProjectControllerProvider provider,
  ) {
    return call(
      provider.uuid,
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
  String? get name => r'fullProjectControllerProvider';
}

/// See also [FullProjectController].
class FullProjectControllerProvider
    extends NotifierProviderImpl<FullProjectController, FullProject> {
  /// See also [FullProjectController].
  FullProjectControllerProvider(
    this.uuid,
  ) : super.internal(
          () => FullProjectController()..uuid = uuid,
          from: fullProjectControllerProvider,
          name: r'fullProjectControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fullProjectControllerHash,
          dependencies: FullProjectControllerFamily._dependencies,
          allTransitiveDependencies:
              FullProjectControllerFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is FullProjectControllerProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FullProject runNotifierBuild(
    covariant FullProjectController notifier,
  ) {
    return notifier.build(
      uuid,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
