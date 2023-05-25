// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtimecomments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$realTimeCommentsStreamHash() =>
    r'6a657a14abc2a023f9e531a6d233e2f26fbde8ee';

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

typedef RealTimeCommentsStreamRef = StreamProviderRef<ChannelReadEvent>;

/// See also [realTimeCommentsStream].
@ProviderFor(realTimeCommentsStream)
const realTimeCommentsStreamProvider = RealTimeCommentsStreamFamily();

/// See also [realTimeCommentsStream].
class RealTimeCommentsStreamFamily
    extends Family<AsyncValue<ChannelReadEvent>> {
  /// See also [realTimeCommentsStream].
  const RealTimeCommentsStreamFamily();

  /// See also [realTimeCommentsStream].
  RealTimeCommentsStreamProvider call({
    required String uuid,
  }) {
    return RealTimeCommentsStreamProvider(
      uuid: uuid,
    );
  }

  @override
  RealTimeCommentsStreamProvider getProviderOverride(
    covariant RealTimeCommentsStreamProvider provider,
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
  String? get name => r'realTimeCommentsStreamProvider';
}

/// See also [realTimeCommentsStream].
class RealTimeCommentsStreamProvider extends StreamProvider<ChannelReadEvent> {
  /// See also [realTimeCommentsStream].
  RealTimeCommentsStreamProvider({
    required this.uuid,
  }) : super.internal(
          (ref) => realTimeCommentsStream(
            ref,
            uuid: uuid,
          ),
          from: realTimeCommentsStreamProvider,
          name: r'realTimeCommentsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$realTimeCommentsStreamHash,
          dependencies: RealTimeCommentsStreamFamily._dependencies,
          allTransitiveDependencies:
              RealTimeCommentsStreamFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is RealTimeCommentsStreamProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
