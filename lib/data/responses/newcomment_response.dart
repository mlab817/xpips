import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/comment.dart';

part 'newcomment_response.freezed.dart';
part 'newcomment_response.g.dart';

/// Returned by the addComment server request
///
/// The `data` parameter is an instance of [Comment].
/// The `success` parameter is a boolean that indicates whether the request succeeded or not.
/// The `message` parameters is a String returned by the request which can be used to provide feedback to the user.
@freezed
class NewCommentResponse with _$NewCommentResponse {
  factory NewCommentResponse({
    required Comment data,
    required bool success,
    required String message,
  }) = _NewCommentResponse;

  factory NewCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$NewCommentResponseFromJson(json);
}
