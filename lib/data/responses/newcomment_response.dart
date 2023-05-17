import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/comment.dart';

part 'newcomment_response.freezed.dart';
part 'newcomment_response.g.dart';

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
