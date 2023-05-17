import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pips/domain/models/fullproject.dart';

part 'createproject_response.freezed.dart';
part 'createproject_response.g.dart';

@freezed
class CreateProjectResponse with _$CreateProjectResponse {
  factory CreateProjectResponse({
    required FullProject data,
    required String status,
  }) = _CreateProjectResponse;

  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResponseFromJson(json);
}
