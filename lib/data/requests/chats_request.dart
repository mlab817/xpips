import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_request.freezed.dart';
part 'chats_request.g.dart';

@freezed
class ChatsRequest with _$ChatsRequest {
  factory ChatsRequest({
    @JsonKey(name: "per_page") required int perPage,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "q", includeIfNull: true) String? q,
  }) = _ChatsRequest;

  factory ChatsRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatsRequestFromJson(json);

  static ChatsRequest initial() {
    return ChatsRequest(perPage: 25, page: 1);
  }
}
