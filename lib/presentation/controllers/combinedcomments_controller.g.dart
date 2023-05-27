// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combinedcomments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$combinedCommentsHash() => r'bb3e86ac9b91d2c7740906703a23dec2c5be5aa5';

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

typedef CombinedCommentsRef = StreamProviderRef<List<Comment>>;

/// See also [combinedComments].
@ProviderFor(combinedComments)
const combinedCommentsProvider = CombinedCommentsFamily();

/// See also [combinedComments].
class CombinedCommentsFamily extends Family<AsyncValue<List<Comment>>> {
  /// See also [combinedComments].
  const CombinedCommentsFamily();

  /// See also [combinedComments].
  CombinedCommentsProvider call({
    required String uuid,
  }) {
    return CombinedCommentsProvider(
      uuid: uuid,
    );
  }

  @override
  CombinedCommentsProvider getProviderOverride(
    covariant CombinedCommentsProvider provider,
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
  String? get name => r'combinedCommentsProvider';
}

/// See also [combinedComments].
class CombinedCommentsProvider extends StreamProvider<List<Comment>> {
  /// See also [combinedComments].
  CombinedCommentsProvider({
    required this.uuid,
  }) : super.internal(
          (ref) => combinedComments(
            ref,
            uuid: uuid,
          ),
          from: combinedCommentsProvider,
          name: r'combinedCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$combinedCommentsHash,
          dependencies: CombinedCommentsFamily._dependencies,
          allTransitiveDependencies:
              CombinedCommentsFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is CombinedCommentsProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
