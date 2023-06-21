import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'option.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Option {
  @HiveField(0)
  String label;

  @HiveField(1)
  int value;

  @HiveField(2)
  String? description;

  @HiveField(3)
  List<Option>? children;

  @HiveField(4)
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
