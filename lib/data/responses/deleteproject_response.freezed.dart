// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deleteproject_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeleteProjectResponse _$DeleteProjectResponseFromJson(
    Map<String, dynamic> json) {
  return _DeleteProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$DeleteProjectResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteProjectResponseCopyWith<DeleteProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteProjectResponseCopyWith<$Res> {
  factory $DeleteProjectResponseCopyWith(DeleteProjectResponse value,
          $Res Function(DeleteProjectResponse) then) =
      _$DeleteProjectResponseCopyWithImpl<$Res, DeleteProjectResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DeleteProjectResponseCopyWithImpl<$Res,
        $Val extends DeleteProjectResponse>
    implements $DeleteProjectResponseCopyWith<$Res> {
  _$DeleteProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeleteProjectResponseCopyWith<$Res>
    implements $DeleteProjectResponseCopyWith<$Res> {
  factory _$$_DeleteProjectResponseCopyWith(_$_DeleteProjectResponse value,
          $Res Function(_$_DeleteProjectResponse) then) =
      __$$_DeleteProjectResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_DeleteProjectResponseCopyWithImpl<$Res>
    extends _$DeleteProjectResponseCopyWithImpl<$Res, _$_DeleteProjectResponse>
    implements _$$_DeleteProjectResponseCopyWith<$Res> {
  __$$_DeleteProjectResponseCopyWithImpl(_$_DeleteProjectResponse _value,
      $Res Function(_$_DeleteProjectResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_DeleteProjectResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeleteProjectResponse implements _DeleteProjectResponse {
  _$_DeleteProjectResponse({required this.message});

  factory _$_DeleteProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteProjectResponseFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'DeleteProjectResponse(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteProjectResponse &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteProjectResponseCopyWith<_$_DeleteProjectResponse> get copyWith =>
      __$$_DeleteProjectResponseCopyWithImpl<_$_DeleteProjectResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteProjectResponseToJson(
      this,
    );
  }
}

abstract class _DeleteProjectResponse implements DeleteProjectResponse {
  factory _DeleteProjectResponse({required final String message}) =
      _$_DeleteProjectResponse;

  factory _DeleteProjectResponse.fromJson(Map<String, dynamic> json) =
      _$_DeleteProjectResponse.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteProjectResponseCopyWith<_$_DeleteProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
