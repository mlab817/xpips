import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/pipsstatus.dart';

part 'pipsstatus_response.freezed.dart';
part 'pipsstatus_response.g.dart';

@freezed
class PipsStatusResponse with _$PipsStatusResponse {
  factory PipsStatusResponse({
    required List<PipsStatus> data,
  }) = _PipsStatusResponse;

  factory PipsStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$PipsStatusResponseFromJson(json);
}
