import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/entities/comment.dart';

part 'comments_response.freezed.dart';
part 'comments_response.g.dart';

@freezed
class CommentsResponse with _$CommentsResponse {
  factory CommentsResponse({
    required List<Comment> data,
  }) = _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
}
