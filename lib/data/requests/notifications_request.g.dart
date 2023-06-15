// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationsRequest _$$_NotificationsRequestFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationsRequest(
      perPage: json['per_page'] as int,
      page: json['page'] as int,
      q: json['q'] as String?,
      filter: json['filter'] as String?,
    );

Map<String, dynamic> _$$_NotificationsRequestToJson(
        _$_NotificationsRequest instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'page': instance.page,
      'q': instance.q,
      'filter': instance.filter,
    };
