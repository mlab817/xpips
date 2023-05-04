import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data.freezed.dart';
part 'notification_data.g.dart';

@freezed
class NotificationData with _$NotificationData {
  factory NotificationData({
    @JsonKey(name: 'sender') required String sender,
    @JsonKey(name: 'subject') required String subject,
    @JsonKey(name: 'message') required String message,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}
