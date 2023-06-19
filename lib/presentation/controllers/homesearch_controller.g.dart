// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homesearch_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeSearchHash() => r'acfeb63e2d14725fd8396353a7423af3450b0099';

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

typedef HomeSearchRef = FutureProviderRef<ProjectsResponse>;

/// See also [homeSearch].
@ProviderFor(homeSearch)
const homeSearchProvider = HomeSearchFamily();

/// See also [homeSearch].
class HomeSearchFamily extends Family<AsyncValue<ProjectsResponse>> {
  /// See also [homeSearch].
  const HomeSearchFamily();

  /// See also [homeSearch].
  HomeSearchProvider call({
    required String query,
  }) {
    return HomeSearchProvider(
      query: query,
    );
  }

  @override
  HomeSearchProvider getProviderOverride(
    covariant HomeSearchProvider provider,
  ) {
    return call(
      query: provider.query,
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
  String? get name => r'homeSearchProvider';
}

/// See also [homeSearch].
class HomeSearchProvider extends FutureProvider<ProjectsResponse> {
  /// See also [homeSearch].
  HomeSearchProvider({
    required this.query,
  }) : super.internal(
          (ref) => homeSearch(
            ref,
            query: query,
          ),
          from: homeSearchProvider,
          name: r'homeSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homeSearchHash,
          dependencies: HomeSearchFamily._dependencies,
          allTransitiveDependencies:
              HomeSearchFamily._allTransitiveDependencies,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is HomeSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
