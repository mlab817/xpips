import 'package:freezed_annotation/freezed_annotation.dart';

part 'validateemail_response.g.dart';

@JsonSerializable()
class ValidateEmailResponse {
  bool exists;

  ValidateEmailResponse({
    required this.exists,
  });

  factory ValidateEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateEmailResponseToJson(this);
}
