import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/models/models.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required int id,
    required String comment,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "is_resolved") required bool isResolved,
    @JsonKey(name: "user") UserQuickResource? user,
    bool? isSent,
    String? localId,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  static Comment initial() {
    return Comment(
      id: 1,
      comment: 'comment',
      userId: 1,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      isResolved: false,
      user: UserQuickResource.initial(),
    );
  }
}
