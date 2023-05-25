import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/meta.dart';
import '../../domain/models/notifications.dart';

part 'notifications_response.g.dart';

@JsonSerializable()
class NotificationsResponse {
  @JsonKey(name: 'data')
  List<Notifications> data;

  @JsonKey(name: 'meta')
  Meta meta;

  NotificationsResponse({
    required this.data,
    required this.meta,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}
