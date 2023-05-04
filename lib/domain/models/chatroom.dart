import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';
import 'user.dart';

part 'chatroom.freezed.dart';
part 'chatroom.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  factory ChatRoom({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "users") List<User>? users,
    @JsonKey(name: "messages") List<Message>? messages,
    @JsonKey(name: "last_message") Message? lastMessage,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);
}
