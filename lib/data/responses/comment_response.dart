import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/models/models.dart';

part 'comment_response.freezed.dart';
part 'comment_response.g.dart';

@freezed
class CommentResponse with _$CommentResponse {
  factory CommentResponse({
    required Comment comment,
  }) = _CommentResponse;

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);
}
