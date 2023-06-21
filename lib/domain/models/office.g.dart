// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfficeAdapter extends TypeAdapter<Office> {
  @override
  final int typeId = 2;

  @override
  Office read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Office(
      id: fields[0] as int,
      name: fields[1] as String,
      acronym: fields[2] as String,
      uuid: fields[3] as String?,
      headName: fields[4] as String?,
      headPosition: fields[5] as String?,
      email: fields[6] as String?,
      phoneNumber: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Office obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.acronym)
      ..writeByte(3)
      ..write(obj.uuid)
      ..writeByte(4)
      ..write(obj.headName)
      ..writeByte(5)
      ..write(obj.headPosition)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfficeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Office _$$_OfficeFromJson(Map<String, dynamic> json) => _$_Office(
      id: json['id'] as int,
      name: json['name'] as String,
      acronym: json['acronym'] as String,
      uuid: json['uuid'] as String?,
      headName: json['head_name'] as String?,
      headPosition: json['head_position'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$$_OfficeToJson(_$_Office instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'acronym': instance.acronym,
      'uuid': instance.uuid,
      'head_name': instance.headName,
      'head_position': instance.headPosition,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
    };
