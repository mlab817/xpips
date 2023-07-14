// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pipol_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PipolStatus _$PipolStatusFromJson(Map<String, dynamic> json) {
  return _PipolStatus.fromJson(json);
}

/// @nodoc
mixin _$PipolStatus {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'projects_count')
  int get projectsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PipolStatusCopyWith<PipolStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PipolStatusCopyWith<$Res> {
  factory $PipolStatusCopyWith(
          PipolStatus value, $Res Function(PipolStatus) then) =
      _$PipolStatusCopyWithImpl<$Res, PipolStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'projects_count') int projectsCount});
}

/// @nodoc
class _$PipolStatusCopyWithImpl<$Res, $Val extends PipolStatus>
    implements $PipolStatusCopyWith<$Res> {
  _$PipolStatusCopyWithImpl(this._value, this._then);

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
abstract class _$$_PipolStatusCopyWith<$Res>
    implements $PipolStatusCopyWith<$Res> {
  factory _$$_PipolStatusCopyWith(
          _$_PipolStatus value, $Res Function(_$_PipolStatus) then) =
      __$$_PipolStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'projects_count') int projectsCount});
}

/// @nodoc
class __$$_PipolStatusCopyWithImpl<$Res>
    extends _$PipolStatusCopyWithImpl<$Res, _$_PipolStatus>
    implements _$$_PipolStatusCopyWith<$Res> {
  __$$_PipolStatusCopyWithImpl(
      _$_PipolStatus _value, $Res Function(_$_PipolStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? projectsCount = null,
  }) {
    return _then(_$_PipolStatus(
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
class _$_PipolStatus implements _PipolStatus {
  _$_PipolStatus(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'projects_count') required this.projectsCount});

  factory _$_PipolStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PipolStatusFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'projects_count')
  final int projectsCount;

  @override
  String toString() {
    return 'PipolStatus(id: $id, name: $name, projectsCount: $projectsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PipolStatus &&
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
  _$$_PipolStatusCopyWith<_$_PipolStatus> get copyWith =>
      __$$_PipolStatusCopyWithImpl<_$_PipolStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PipolStatusToJson(
      this,
    );
  }
}

abstract class _PipolStatus implements PipolStatus {
  factory _PipolStatus(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'projects_count') required final int projectsCount}) =
      _$_PipolStatus;

  factory _PipolStatus.fromJson(Map<String, dynamic> json) =
      _$_PipolStatus.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'projects_count')
  int get projectsCount;
  @override
  @JsonKey(ignore: true)
  _$$_PipolStatusCopyWith<_$_PipolStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
