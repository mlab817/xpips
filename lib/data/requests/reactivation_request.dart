import 'package:freezed_annotation/freezed_annotation.dart';

part 'reactivation_request.freezed.dart';
part 'reactivation_request.g.dart';

@freezed
class ReactivationRequest with _$ReactivationRequest {
  factory ReactivationRequest({
    required String email,
    required String authorization,
  }) = _ReactivationRequest;

  factory ReactivationRequest.fromJson(Map<String, dynamic> json) =>
      _$ReactivationRequestFromJson(json);
}
