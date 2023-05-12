import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/options.dart';

part 'options_response.freezed.dart';
part 'options_response.g.dart';

@freezed
class OptionsResponse with _$OptionsResponse {
  factory OptionsResponse({
    required Options data,
  }) = _OptionsResponse;

  factory OptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$OptionsResponseFromJson(json);
}
