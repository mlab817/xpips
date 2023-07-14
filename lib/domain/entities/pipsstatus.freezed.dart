// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pipsstatus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PipsStatus _$PipsStatusFromJson(Map<String, dynamic> json) {
  return _PipsStatus.fromJson(json);
}

/// @nodoc
mixin _$PipsStatus {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "projects_count")
  int get projectsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PipsStatusCopyWith<PipsStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PipsStatusCopyWith<$Res> {
  factory $PipsStatusCopyWith(
          PipsStatus value, $Res Function(PipsStatus) then) =
      _$PipsStatusCopyWithImpl<$Res, PipsStatus>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "projects_count") int projectsCount});
}

/// @nodoc
class _$PipsStatusCopyWithImpl<$Res, $Val extends PipsStatus>
    implements $PipsStatusCopyWith<$Res> {
  _$PipsStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? projectsCount = null,
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
      projectsCount: null == projectsCount
          ? _value.projectsCount
          : projectsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PipsStatusCopyWith<$Res>
    implements $PipsStatusCopyWith<$Res> {
  factory _$$_PipsStatusCopyWith(
          _$_PipsStatus value, $Res Function(_$_PipsStatus) then) =
      __$$_PipsStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "projects_count") int projectsCount});
}

/// @nodoc
class __$$_PipsStatusCopyWithImpl<$Res>
    extends _$PipsStatusCopyWithImpl<$Res, _$_PipsStatus>
    implements _$$_PipsStatusCopyWith<$Res> {
  __$$_PipsStatusCopyWithImpl(
      _$_PipsStatus _value, $Res Function(_$_PipsStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? projectsCount = null,
  }) {
    return _then(_$_PipsStatus(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectsCount: null == projectsCount
          ? _value.projectsCount
          : projectsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PipsStatus implements _PipsStatus {
  _$_PipsStatus(
      {required this.id,
      required this.name,
      @JsonKey(name: "projects_count") required this.projectsCount});

  factory _$_PipsStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PipsStatusFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: "projects_count")
  final int projectsCount;

  @override
  String toString() {
    return 'PipsStatus(id: $id, name: $name, projectsCount: $projectsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PipsStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.projectsCount, projectsCount) ||
                other.projectsCount == projectsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, projectsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PipsStatusCopyWith<_$_PipsStatus> get copyWith =>
      __$$_PipsStatusCopyWithImpl<_$_PipsStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PipsStatusToJson(
      this,
    );
  }
}

abstract class _PipsStatus implements PipsStatus {
  factory _PipsStatus(
          {required final int id,
          required final String name,
          @JsonKey(name: "projects_count") required final int projectsCount}) =
      _$_PipsStatus;

  factory _PipsStatus.fromJson(Map<String, dynamic> json) =
      _$_PipsStatus.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: "projects_count")
  int get projectsCount;
  @override
  @JsonKey(ignore: true)
  _$$_PipsStatusCopyWith<_$_PipsStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
