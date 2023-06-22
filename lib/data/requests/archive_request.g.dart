// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArchiveRequest _$$_ArchiveRequestFromJson(Map<String, dynamic> json) =>
    _$_ArchiveRequest(
      perPage: json['per_page'] as int,
      page: json['page'] as int,
      q: json['q'] as String?,
    );

Map<String, dynamic> _$$_ArchiveRequestToJson(_$_ArchiveRequest instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'page': instance.page,
      'q': instance.q,
    };
