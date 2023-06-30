// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newcomment_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newCommentRepositoryHash() =>
    r'c72522c1ad9465a233d2cc9ddc6870de5eaa15ca';

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

typedef NewCommentRepositoryRef = ProviderRef<NewCommentRepository>;

/// See also [newCommentRepository].
@ProviderFor(newCommentRepository)
const newCommentRepositoryProvider = NewCommentRepositoryFamily();

/// See also [newCommentRepository].
class NewCommentRepositoryFamily extends Family<NewCommentRepository> {
  /// See also [newCommentRepository].
  const NewCommentRepositoryFamily();

  /// See also [newCommentRepository].
  NewCommentRepositoryProvider call({
    required String uuid,
  }) {
    return NewCommentRepositoryProvider(
      uuid: uuid,
    );
  }

  @override
  NewCommentRepositoryProvider getProviderOverride(
    covariant NewCommentRepositoryProvider provider,
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
  String? get name => r'newCommentRepositoryProvider';
}

/// See also [newCommentRepository].
class NewCommentRepositoryProvider extends Provider<NewCommentRepository> {
  /// See also [newCommentRepository].
  NewCommentRepositoryProvider({
    required this.uuid,
  }) : super.internal(
          (ref) => newCommentRepository(
            ref,
            uuid: uuid,
          ),
          from: newCommentRepositoryProvider,
          name: r'newCommentRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newCommentRepositoryHash,
          dependencies: NewCommentRepositoryFamily._dependencies,
          allTransitiveDependencies:
              NewCommentRepositoryFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is NewCommentRepositoryProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
