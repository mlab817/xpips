import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';
part 'option.g.dart';

abstract class BaseOption {
  String label;

  int value;

  String? description;

  List<Option>? children;

  BaseOption({
    required this.label,
    required this.value,
    this.description,
    this.children,
  });
}

@freezed
class Option with _$Option {
  factory Option({
    required String label,
    required int value,
    String? description,
    List<Option>? children,
    @JsonKey(name: 'parent_id') int? parentId,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
