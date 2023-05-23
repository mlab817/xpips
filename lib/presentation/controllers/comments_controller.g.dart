// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentsControllerHash() =>
    r'a690d88b7d6e6a17976b0484ba771f5888047965';

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

typedef CommentsControllerRef = FutureProviderRef<CommentsResponse>;

/// See also [commentsController].
@ProviderFor(commentsController)
const commentsControllerProvider = CommentsControllerFamily();

/// See also [commentsController].
class CommentsControllerFamily extends Family<AsyncValue<CommentsResponse>> {
  /// See also [commentsController].
  const CommentsControllerFamily();

  /// See also [commentsController].
  CommentsControllerProvider call({
    required String uuid,
  }) {
    return CommentsControllerProvider(
      uuid: uuid,
    );
  }

  @override
  CommentsControllerProvider getProviderOverride(
    covariant CommentsControllerProvider provider,
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
  String? get name => r'commentsControllerProvider';
}

/// See also [commentsController].
class CommentsControllerProvider extends FutureProvider<CommentsResponse> {
  /// See also [commentsController].
  CommentsControllerProvider({
    required this.uuid,
  }) : super.internal(
          (ref) => commentsController(
            ref,
            uuid: uuid,
          ),
          from: commentsControllerProvider,
          name: r'commentsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentsControllerHash,
          dependencies: CommentsControllerFamily._dependencies,
          allTransitiveDependencies:
              CommentsControllerFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is CommentsControllerProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
