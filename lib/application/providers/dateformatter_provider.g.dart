// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dateformatter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateFormatterHash() => r'12f2c5b2418cf2c9136a154553d9509eadd068fb';

/// Provide a consistent way to format dates in the app with yMMMd
/// returns [DateFormat]
/// Use as dateFormatterProvider.format(date)
///
/// Copied from [dateFormatter].
@ProviderFor(dateFormatter)
final dateFormatterProvider = Provider<DateFormat>.internal(
  dateFormatter,
  name: r'dateFormatterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dateFormatterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DateFormatterRef = ProviderRef<DateFormat>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
