// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationRequest _$$_PaginationRequestFromJson(Map<String, dynamic> json) =>
    _$_PaginationRequest(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      q: json['q'] as String?,
    );

Map<String, dynamic> _$$_PaginationRequestToJson(
        _$_PaginationRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'q': instance.q,
    };
