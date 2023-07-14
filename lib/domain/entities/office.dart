import 'package:freezed_annotation/freezed_annotation.dart';

part 'office.freezed.dart';
part 'office.g.dart';

@freezed
class Office with _$Office {
  factory Office({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "acronym") required String acronym,
    @JsonKey(name: "uuid") String? uuid,
    @JsonKey(name: "head_name") String? headName,
    @JsonKey(name: "head_position") String? headPosition,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
  }) = _Office;

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  String get label => acronym;

  int get value => id;

  Office._();
}
