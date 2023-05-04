import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/chatroom.dart';

part 'chatroom_response.freezed.dart';
part 'chatroom_response.g.dart';

@freezed
class ChatRoomResponse with _$ChatRoomResponse {
  factory ChatRoomResponse({
    @JsonKey(name: "data") required ChatRoom data,
  }) = _ChatRoomResponse;

  factory ChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomResponseFromJson(json);
}
