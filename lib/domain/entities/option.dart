import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  String label;

  int value;

  String? description;

  List<Option>? children;

  @JsonKey(name: 'parent_id')
  int? parentId;

  Option({
    required this.label,
    required this.value,
    this.description,
    this.children,
    this.parentId,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
