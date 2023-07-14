import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_data.dart';

part 'notifications.freezed.dart';

part 'notifications.g.dart';

@freezed
class Notifications with _$Notifications {
  factory Notifications({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'data') required NotificationData data,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'read_at') DateTime? readAt,
  }) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
}
