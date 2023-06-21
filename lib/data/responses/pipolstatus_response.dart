import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/models.dart';

part 'pipolstatus_response.freezed.dart';
part 'pipolstatus_response.g.dart';

@freezed
class PipolStatusResponse with _$PipolStatusResponse {
  factory PipolStatusResponse({
    required List<PipolStatus> data,
  }) = _PipolStatusResponse;

  factory PipolStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$PipolStatusResponseFromJson(json);
}
