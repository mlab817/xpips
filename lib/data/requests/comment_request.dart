import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_request.freezed.dart';
part 'comment_request.g.dart';

@freezed
class CommentRequest with _$CommentRequest {
  factory CommentRequest({
    required String comment,
  }) = _CommentRequest;

  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);
}
