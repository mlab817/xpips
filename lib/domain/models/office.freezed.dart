// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'office.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return _Office.fromJson(json);
}

/// @nodoc
mixin _$Office {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "acronym")
  String get acronym => throw _privateConstructorUsedError;
  @JsonKey(name: "uuid")
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "head_name")
  String? get headName => throw _privateConstructorUsedError;
  @JsonKey(name: "head_position")
  String? get headPosition => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeCopyWith<Office> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeCopyWith<$Res> {
  factory $OfficeCopyWith(Office value, $Res Function(Office) then) =
      _$OfficeCopyWithImpl<$Res, Office>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "acronym") String acronym,
      @JsonKey(name: "uuid") String? uuid,
      @JsonKey(name: "head_name") String? headName,
      @JsonKey(name: "head_position") String? headPosition,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber});
}

/// @nodoc
class _$OfficeCopyWithImpl<$Res, $Val extends Office>
    implements $OfficeCopyWith<$Res> {
  _$OfficeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? acronym = null,
    Object? uuid = freezed,
    Object? headName = freezed,
    Object? headPosition = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      acronym: null == acronym
          ? _value.acronym
          : acronym // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      headName: freezed == headName
          ? _value.headName
          : headName // ignore: cast_nullable_to_non_nullable
              as String?,
      headPosition: freezed == headPosition
          ? _value.headPosition
          : headPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfficeCopyWith<$Res> implements $OfficeCopyWith<$Res> {
  factory _$$_OfficeCopyWith(_$_Office value, $Res Function(_$_Office) then) =
      __$$_OfficeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "acronym") String acronym,
      @JsonKey(name: "uuid") String? uuid,
      @JsonKey(name: "head_name") String? headName,
      @JsonKey(name: "head_position") String? headPosition,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber});
}

/// @nodoc
class __$$_OfficeCopyWithImpl<$Res>
    extends _$OfficeCopyWithImpl<$Res, _$_Office>
    implements _$$_OfficeCopyWith<$Res> {
  __$$_OfficeCopyWithImpl(_$_Office _value, $Res Function(_$_Office) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? acronym = null,
    Object? uuid = freezed,
    Object? headName = freezed,
    Object? headPosition = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_Office(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      acronym: null == acronym
          ? _value.acronym
          : acronym // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      headName: freezed == headName
          ? _value.headName
          : headName // ignore: cast_nullable_to_non_nullable
              as String?,
      headPosition: freezed == headPosition
          ? _value.headPosition
          : headPosition // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Office implements _Office {
  _$_Office(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "acronym") required this.acronym,
      @JsonKey(name: "uuid") this.uuid,
      @JsonKey(name: "head_name") this.headName,
      @JsonKey(name: "head_position") this.headPosition,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phoneNumber});

  factory _$_Office.fromJson(Map<String, dynamic> json) =>
      _$$_OfficeFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "acronym")
  final String acronym;
  @override
  @JsonKey(name: "uuid")
  final String? uuid;
  @override
  @JsonKey(name: "head_name")
  final String? headName;
  @override
  @JsonKey(name: "head_position")
  final String? headPosition;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;

  @override
  String toString() {
    return 'Office(id: $id, name: $name, acronym: $acronym, uuid: $uuid, headName: $headName, headPosition: $headPosition, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Office &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.acronym, acronym) || other.acronym == acronym) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.headName, headName) ||
                other.headName == headName) &&
            (identical(other.headPosition, headPosition) ||
                other.headPosition == headPosition) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, acronym, uuid,
      headName, headPosition, email, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfficeCopyWith<_$_Office> get copyWith =>
      __$$_OfficeCopyWithImpl<_$_Office>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfficeToJson(
      this,
    );
  }
}

abstract class _Office implements Office {
  factory _Office(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "acronym") required final String acronym,
      @JsonKey(name: "uuid") final String? uuid,
      @JsonKey(name: "head_name") final String? headName,
      @JsonKey(name: "head_position") final String? headPosition,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone_number") final String? phoneNumber}) = _$_Office;

  factory _Office.fromJson(Map<String, dynamic> json) = _$_Office.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "acronym")
  String get acronym;
  @override
  @JsonKey(name: "uuid")
  String? get uuid;
  @override
  @JsonKey(name: "head_name")
  String? get headName;
  @override
  @JsonKey(name: "head_position")
  String? get headPosition;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_OfficeCopyWith<_$_Office> get copyWith =>
      throw _privateConstructorUsedError;
}
