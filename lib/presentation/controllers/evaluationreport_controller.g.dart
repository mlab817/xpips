// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluationreport_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$futureEvaluationHash() => r'369d829e90dd53003bfccbdb28f5c2667df65d04';

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

typedef FutureEvaluationRef = FutureProviderRef<EvaluationReportResponse>;

/// See also [futureEvaluation].
@ProviderFor(futureEvaluation)
const futureEvaluationProvider = FutureEvaluationFamily();

/// See also [futureEvaluation].
class FutureEvaluationFamily
    extends Family<AsyncValue<EvaluationReportResponse>> {
  /// See also [futureEvaluation].
  const FutureEvaluationFamily();

  /// See also [futureEvaluation].
  FutureEvaluationProvider call({
    required String uuid,
  }) {
    return FutureEvaluationProvider(
      uuid: uuid,
    );
  }

  @override
  FutureEvaluationProvider getProviderOverride(
    covariant FutureEvaluationProvider provider,
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
  String? get name => r'futureEvaluationProvider';
}

/// See also [futureEvaluation].
class FutureEvaluationProvider
    extends FutureProvider<EvaluationReportResponse> {
  /// See also [futureEvaluation].
  FutureEvaluationProvider({
    required this.uuid,
  }) : super.internal(
          (ref) => futureEvaluation(
            ref,
            uuid: uuid,
          ),
          from: futureEvaluationProvider,
          name: r'futureEvaluationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$futureEvaluationHash,
          dependencies: FutureEvaluationFamily._dependencies,
          allTransitiveDependencies:
              FutureEvaluationFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is FutureEvaluationProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$evaluationReportControllerHash() =>
    r'89453c5e101fb26aac5743ce8674f485397ac6e9';

abstract class _$EvaluationReportController
    extends BuildlessNotifier<EvaluationReport> {
  late final String uuid;

  EvaluationReport build(
    String uuid,
  );
}

/// See also [EvaluationReportController].
@ProviderFor(EvaluationReportController)
const evaluationReportControllerProvider = EvaluationReportControllerFamily();

/// See also [EvaluationReportController].
class EvaluationReportControllerFamily extends Family<EvaluationReport> {
  /// See also [EvaluationReportController].
  const EvaluationReportControllerFamily();

  /// See also [EvaluationReportController].
  EvaluationReportControllerProvider call(
    String uuid,
  ) {
    return EvaluationReportControllerProvider(
      uuid,
    );
  }

  @override
  EvaluationReportControllerProvider getProviderOverride(
    covariant EvaluationReportControllerProvider provider,
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
  String? get name => r'evaluationReportControllerProvider';
}

/// See also [EvaluationReportController].
class EvaluationReportControllerProvider
    extends NotifierProviderImpl<EvaluationReportController, EvaluationReport> {
  /// See also [EvaluationReportController].
  EvaluationReportControllerProvider(
    this.uuid,
  ) : super.internal(
          () => EvaluationReportController()..uuid = uuid,
          from: evaluationReportControllerProvider,
          name: r'evaluationReportControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$evaluationReportControllerHash,
          dependencies: EvaluationReportControllerFamily._dependencies,
          allTransitiveDependencies:
              EvaluationReportControllerFamily._allTransitiveDependencies,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is EvaluationReportControllerProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EvaluationReport runNotifierBuild(
    covariant EvaluationReportController notifier,
  ) {
    return notifier.build(
      uuid,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
