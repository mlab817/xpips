import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_request.freezed.dart';
part 'comment_request.g.dart';

/// Http Request for adding a new comment to a project
///
/// The `comment` is a required String argument.
@freezed
class CommentRequest with _$CommentRequest {
  factory CommentRequest({
    required String comment,
  }) = _CommentRequest;

  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);
}
