import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_request.g.dart';

@JsonSerializable()
class FcmRequest {
  @JsonKey(name: 'fcm_token')
  String fcmToken;

  FcmRequest({
    required this.fcmToken,
  });

  factory FcmRequest.fromJson(Map<String, dynamic> json) =>
      _$FcmRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FcmRequestToJson(this);
}
