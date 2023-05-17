// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updateproject_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateProjectResponse _$UpdateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return _UpdateProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateProjectResponse {
  FullProject get data => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProjectResponseCopyWith<UpdateProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProjectResponseCopyWith<$Res> {
  factory $UpdateProjectResponseCopyWith(UpdateProjectResponse value,
          $Res Function(UpdateProjectResponse) then) =
      _$UpdateProjectResponseCopyWithImpl<$Res, UpdateProjectResponse>;
  @useResult
  $Res call({FullProject data, String status});

  $FullProjectCopyWith<$Res> get data;
}

/// @nodoc
class _$UpdateProjectResponseCopyWithImpl<$Res,
        $Val extends UpdateProjectResponse>
    implements $UpdateProjectResponseCopyWith<$Res> {
  _$UpdateProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FullProject,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FullProjectCopyWith<$Res> get data {
    return $FullProjectCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UpdateProjectResponseCopyWith<$Res>
    implements $UpdateProjectResponseCopyWith<$Res> {
  factory _$$_UpdateProjectResponseCopyWith(_$_UpdateProjectResponse value,
          $Res Function(_$_UpdateProjectResponse) then) =
      __$$_UpdateProjectResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FullProject data, String status});

  @override
  $FullProjectCopyWith<$Res> get data;
}

/// @nodoc
class __$$_UpdateProjectResponseCopyWithImpl<$Res>
    extends _$UpdateProjectResponseCopyWithImpl<$Res, _$_UpdateProjectResponse>
    implements _$$_UpdateProjectResponseCopyWith<$Res> {
  __$$_UpdateProjectResponseCopyWithImpl(_$_UpdateProjectResponse _value,
      $Res Function(_$_UpdateProjectResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$_UpdateProjectResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FullProject,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateProjectResponse implements _UpdateProjectResponse {
  _$_UpdateProjectResponse({required this.data, required this.status});

  factory _$_UpdateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateProjectResponseFromJson(json);

  @override
  final FullProject data;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateProjectResponse(data: $data, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProjectResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateProjectResponseCopyWith<_$_UpdateProjectResponse> get copyWith =>
      __$$_UpdateProjectResponseCopyWithImpl<_$_UpdateProjectResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateProjectResponseToJson(
      this,
    );
  }
}

abstract class _UpdateProjectResponse implements UpdateProjectResponse {
  factory _UpdateProjectResponse(
      {required final FullProject data,
      required final String status}) = _$_UpdateProjectResponse;

  factory _UpdateProjectResponse.fromJson(Map<String, dynamic> json) =
      _$_UpdateProjectResponse.fromJson;

  @override
  FullProject get data;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateProjectResponseCopyWith<_$_UpdateProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
