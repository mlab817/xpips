import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  factory Message({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "content") required String content,
    @JsonKey(name: "chat_room_id") required int chatRoomId,
    @JsonKey(name: "sender_id") required int senderId,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false) final bool? sent,
    @JsonKey(includeFromJson: false, includeToJson: false) final int? localId,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
