import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/models.dart';

part 'users_response.freezed.dart';
part 'users_response.g.dart';

@freezed
class UsersResponse with _$UsersResponse {
  factory UsersResponse({
    required List<User> data,
    required Meta meta,
  }) = _UsersResponse;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
}
