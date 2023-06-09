import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/option.dart';

part 'newproject_request.g.dart';

@JsonSerializable()
class NewProjectRequest {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'type_id')
  final int typeId;

  @JsonKey(name: 'regular_program')
  final bool regularProgram;

  @JsonKey(name: 'bases')
  final List<int> bases;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'total_cost')
  final double totalCost;

  NewProjectRequest({
    required this.title,
    required this.typeId,
    required this.regularProgram,
    required this.bases,
    required this.description,
    required this.totalCost,
  });

  factory NewProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$NewProjectRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewProjectRequestToJson(this);
}
