// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pagination _$$_PaginationFromJson(Map<String, dynamic> json) =>
    _$_Pagination(
      total: json['total'] as int,
      pageSize: json['pageSize'] as int,
      current: json['current'] as int,
      last: json['last'] as int,
    );

Map<String, dynamic> _$$_PaginationToJson(_$_Pagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pageSize': instance.pageSize,
      'current': instance.current,
      'last': instance.last,
    };
