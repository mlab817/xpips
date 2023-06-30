import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/office.dart';

part 'offices_response.freezed.dart';
part 'offices_response.g.dart';

/// 
@freezed
class OfficesResponse with _$OfficesResponse {
  factory OfficesResponse({
    required List<Office> data,
  }) = _OfficesResponse;

  factory OfficesResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficesResponseFromJson(json);
}
