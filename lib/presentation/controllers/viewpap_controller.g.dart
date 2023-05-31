// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewpap_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectHash() => r'f4174e2c215cb76ca03b735bcbb4d88bcf97d72a';

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

typedef ProjectRef = FutureProviderRef<ProjectResponse>;

/// See also [project].
@ProviderFor(project)
const projectProvider = ProjectFamily();

/// See also [project].
class ProjectFamily extends Family<AsyncValue<ProjectResponse>> {
  /// See also [project].
  const ProjectFamily();

  /// See also [project].
  ProjectProvider call({
    String? uuid,
  }) {
    return ProjectProvider(
      uuid: uuid,
    );
  }

  @override
  ProjectProvider getProviderOverride(
    covariant ProjectProvider provider,
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
  String? get name => r'projectProvider';
}

/// See also [project].
class ProjectProvider extends FutureProvider<ProjectResponse> {
  /// See also [project].
  ProjectProvider({
    this.uuid,
  }) : super.internal(
          (ref) => project(
            ref,
            uuid: uuid,
          ),
          from: projectProvider,
          name: r'projectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectHash,
          dependencies: ProjectFamily._dependencies,
          allTransitiveDependencies: ProjectFamily._allTransitiveDependencies,
        );

  final String? uuid;

  @override
  bool operator ==(Object other) {
    return other is ProjectProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
