import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'office.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "uuid") String? uuid,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "fullname") String? fullname,
    @JsonKey(name: "position") String? position,
    @JsonKey(name: "contact_number") String? contactNumber,
    @JsonKey(name: "image_url") String? imageUrl,
    String? name,
    @JsonKey(name: "office") Office? office,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
