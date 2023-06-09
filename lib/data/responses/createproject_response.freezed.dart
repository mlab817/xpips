// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'createproject_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateProjectResponse _$CreateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateProjectResponse {
  Project get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateProjectResponseCopyWith<CreateProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectResponseCopyWith<$Res> {
  factory $CreateProjectResponseCopyWith(CreateProjectResponse value,
          $Res Function(CreateProjectResponse) then) =
      _$CreateProjectResponseCopyWithImpl<$Res, CreateProjectResponse>;
  @useResult
  $Res call({Project data, String message, bool success});

  $ProjectCopyWith<$Res> get data;
}

/// @nodoc
class _$CreateProjectResponseCopyWithImpl<$Res,
        $Val extends CreateProjectResponse>
    implements $CreateProjectResponseCopyWith<$Res> {
  _$CreateProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Project,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get data {
    return $ProjectCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateProjectResponseCopyWith<$Res>
    implements $CreateProjectResponseCopyWith<$Res> {
  factory _$$_CreateProjectResponseCopyWith(_$_CreateProjectResponse value,
          $Res Function(_$_CreateProjectResponse) then) =
      __$$_CreateProjectResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Project data, String message, bool success});

  @override
  $ProjectCopyWith<$Res> get data;
}

/// @nodoc
class __$$_CreateProjectResponseCopyWithImpl<$Res>
    extends _$CreateProjectResponseCopyWithImpl<$Res, _$_CreateProjectResponse>
    implements _$$_CreateProjectResponseCopyWith<$Res> {
  __$$_CreateProjectResponseCopyWithImpl(_$_CreateProjectResponse _value,
      $Res Function(_$_CreateProjectResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$_CreateProjectResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Project,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateProjectResponse implements _CreateProjectResponse {
  _$_CreateProjectResponse(
      {required this.data, required this.message, required this.success});

  factory _$_CreateProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CreateProjectResponseFromJson(json);

  @override
  final Project data;
  @override
  final String message;
  @override
  final bool success;

  @override
  String toString() {
    return 'CreateProjectResponse(data: $data, message: $message, success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateProjectResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateProjectResponseCopyWith<_$_CreateProjectResponse> get copyWith =>
      __$$_CreateProjectResponseCopyWithImpl<_$_CreateProjectResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateProjectResponseToJson(
      this,
    );
  }
}

abstract class _CreateProjectResponse implements CreateProjectResponse {
  factory _CreateProjectResponse(
      {required final Project data,
      required final String message,
      required final bool success}) = _$_CreateProjectResponse;

  factory _CreateProjectResponse.fromJson(Map<String, dynamic> json) =
      _$_CreateProjectResponse.fromJson;

  @override
  Project get data;
  @override
  String get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$_CreateProjectResponseCopyWith<_$_CreateProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
