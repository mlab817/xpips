import 'package:freezed_annotation/freezed_annotation.dart';

import 'comment.dart';

part 'chatroom.freezed.dart';
part 'chatroom.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  factory ChatRoom({
    @JsonKey(name: "uuid") required String uuid,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "last_comment") Comment? lastComment,
    @JsonKey(name: "notes") String? notes,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);
}
