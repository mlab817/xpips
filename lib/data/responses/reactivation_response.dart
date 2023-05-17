import 'package:freezed_annotation/freezed_annotation.dart';

part 'reactivation_response.freezed.dart';
part 'reactivation_response.g.dart';

@freezed
class ReactivationResponse with _$ReactivationResponse {
  factory ReactivationResponse({
    required String status,
  }) = _ReactivationResponse;

  factory ReactivationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReactivationResponseFromJson(json);
}
