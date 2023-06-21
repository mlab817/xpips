import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'office.freezed.dart';
part 'office.g.dart';

@HiveType(typeId: 2)
@freezed
class Office with _$Office {
  factory Office({
    @HiveField(0) @JsonKey(name: "id") required int id,
    @HiveField(1) @JsonKey(name: "name") required String name,
    @HiveField(2) @JsonKey(name: "acronym") required String acronym,
    @HiveField(3) @JsonKey(name: "uuid") String? uuid,
    @HiveField(4) @JsonKey(name: "head_name") String? headName,
    @HiveField(5) @JsonKey(name: "head_position") String? headPosition,
    @HiveField(6) @JsonKey(name: "email") String? email,
    @HiveField(7) @JsonKey(name: "phone_number") String? phoneNumber,
  }) = _Office;

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  String get label => acronym;

  int get value => id;

  Office._();
}
