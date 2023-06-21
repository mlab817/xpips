// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionAdapter extends TypeAdapter<Option> {
  @override
  final int typeId = 1;

  @override
  Option read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Option(
      label: fields[0] as String,
      value: fields[1] as int,
      description: fields[2] as String?,
      children: (fields[3] as List?)?.cast<Option>(),
      parentId: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Option obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.children)
      ..writeByte(4)
      ..write(obj.parentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      label: json['label'] as String,
      value: json['value'] as int,
      description: json['description'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentId: json['parent_id'] as int?,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'description': instance.description,
      'children': instance.children,
      'parent_id': instance.parentId,
    };
