import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_request.freezed.dart';
part 'notifications_request.g.dart';

@freezed
class NotificationsRequest with _$NotificationsRequest {
  factory NotificationsRequest({
    @JsonKey(name: "per_page") required int perPage,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "q") String? q,
  }) = _NotificationsRequest;

  factory NotificationsRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationsRequestFromJson(json);
}
