// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewpap_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedProjectHash() => r'1aa3442a892fb6dbb7a85fddab5de528f5fe6117';

/// See also [SelectedProject].
@ProviderFor(SelectedProject)
final selectedProjectProvider =
    NotifierProvider<SelectedProject, Project?>.internal(
  SelectedProject.new,
  name: r'selectedProjectProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedProjectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedProject = Notifier<Project?>;
String _$viewPapControllerHash() => r'25685189e096f4fd24e2f9cbe2137548cf90f5d8';

/// See also [ViewPapController].
@ProviderFor(ViewPapController)
final viewPapControllerProvider =
    AsyncNotifierProvider<ViewPapController, ProjectResponse?>.internal(
  ViewPapController.new,
  name: r'viewPapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$viewPapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ViewPapController = AsyncNotifier<ProjectResponse?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
