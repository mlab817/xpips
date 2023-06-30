import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_request.freezed.dart';
part 'notifications_request.g.dart';

/// Controls notifications request
///
/// The `perPage` argument is an int that defines how many entries will be retrieved by the request.
///
/// The `page` argument is an int that determines the page that will be retrieved by the request.
///
/// The `q` argument is a nullable String that adds a search query for the request.
///
/// The `filter` argument is a nullable String that adds filter to the request.
@freezed
class NotificationsRequest with _$NotificationsRequest {
  factory NotificationsRequest({
    @JsonKey(name: "per_page") required int perPage,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "q") String? q,
    @JsonKey(name: "filter") String? filter,
  }) = _NotificationsRequest;

  factory NotificationsRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationsRequestFromJson(json);
}
