import 'package:freezed_annotation/freezed_annotation.dart';

part 'newmessage_request.freezed.dart';
part 'newmessage_request.g.dart';

@freezed
class NewMessageRequest with _$NewMessageRequest {
  factory NewMessageRequest({
    required int id,
    required String content,
  }) = _NewMessageRequest;

  factory NewMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$NewMessageRequestFromJson(json);
}
