import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_data.dart';

part 'notifications.freezed.dart';
part 'notifications.g.dart';

@freezed
class Notification with _$Notification {
  factory Notification({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'data') required NotificationData data,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'read_at') DateTime? readAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
