import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/models.dart';

part 'chatrooms_response.freezed.dart';
part 'chatrooms_response.g.dart';

@freezed
class ChatRoomsResponse with _$ChatRoomsResponse {
  factory ChatRoomsResponse({
    @JsonKey(name: "data") required List<ChatRoom> data,
    @JsonKey(name: "meta") required Meta meta,
  }) = _ChatRoomsResponse;

  factory ChatRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomsResponseFromJson(json);
}
