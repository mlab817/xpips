import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/models.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'user')
  User user;

  UserResponse({
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
