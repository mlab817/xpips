// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipolstatus_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PipolStatus _$$_PipolStatusFromJson(Map<String, dynamic> json) =>
    _$_PipolStatus(
      id: json['id'] as int,
      name: json['name'] as String,
      projectsCount: json['projects_count'] as int,
    );

Map<String, dynamic> _$$_PipolStatusToJson(_$_PipolStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projects_count': instance.projectsCount,
    };

_$_PipolStatusResponse _$$_PipolStatusResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PipolStatusResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => PipolStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PipolStatusResponseToJson(
        _$_PipolStatusResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pipolStatusRepositoryHash() =>
    r'609033066d87a1614e80d5b7ffc6b390f31b2657';

/// See also [pipolStatusRepository].
@ProviderFor(pipolStatusRepository)
final pipolStatusRepositoryProvider = Provider<PipolStatusRepository>.internal(
  pipolStatusRepository,
  name: r'pipolStatusRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pipolStatusRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PipolStatusRepositoryRef = ProviderRef<PipolStatusRepository>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
