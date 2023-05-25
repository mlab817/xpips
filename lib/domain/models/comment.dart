import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/models/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required int id,
    required String comment,
    @JsonKey(name: "user_id") required int userId,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "is_resolved") required bool isResolved,
    @JsonKey(name: "user") required User user,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
