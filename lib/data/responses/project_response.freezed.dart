// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) {
  return _ProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectResponse {
  FullProject get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectResponseCopyWith<ProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectResponseCopyWith<$Res> {
  factory $ProjectResponseCopyWith(
          ProjectResponse value, $Res Function(ProjectResponse) then) =
      _$ProjectResponseCopyWithImpl<$Res, ProjectResponse>;
  @useResult
  $Res call({FullProject project});

  $FullProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectResponseCopyWithImpl<$Res, $Val extends ProjectResponse>
    implements $ProjectResponseCopyWith<$Res> {
  _$ProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as FullProject,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FullProjectCopyWith<$Res> get project {
    return $FullProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectResponseCopyWith<$Res>
    implements $ProjectResponseCopyWith<$Res> {
  factory _$$_ProjectResponseCopyWith(
          _$_ProjectResponse value, $Res Function(_$_ProjectResponse) then) =
      __$$_ProjectResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FullProject project});

  @override
  $FullProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$_ProjectResponseCopyWithImpl<$Res>
    extends _$ProjectResponseCopyWithImpl<$Res, _$_ProjectResponse>
    implements _$$_ProjectResponseCopyWith<$Res> {
  __$$_ProjectResponseCopyWithImpl(
      _$_ProjectResponse _value, $Res Function(_$_ProjectResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$_ProjectResponse(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as FullProject,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectResponse implements _ProjectResponse {
  _$_ProjectResponse({required this.project});

  factory _$_ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectResponseFromJson(json);

  @override
  final FullProject project;

  @override
  String toString() {
    return 'ProjectResponse(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectResponse &&
            (identical(other.project, project) || other.project == project));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectResponseCopyWith<_$_ProjectResponse> get copyWith =>
      __$$_ProjectResponseCopyWithImpl<_$_ProjectResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectResponseToJson(
      this,
    );
  }
}

abstract class _ProjectResponse implements ProjectResponse {
  factory _ProjectResponse({required final FullProject project}) =
      _$_ProjectResponse;

  factory _ProjectResponse.fromJson(Map<String, dynamic> json) =
      _$_ProjectResponse.fromJson;

  @override
  FullProject get project;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectResponseCopyWith<_$_ProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
