// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newcomment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewCommentResponse _$NewCommentResponseFromJson(Map<String, dynamic> json) {
  return _NewCommentResponse.fromJson(json);
}

/// @nodoc
mixin _$NewCommentResponse {
  Comment get data => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewCommentResponseCopyWith<NewCommentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewCommentResponseCopyWith<$Res> {
  factory $NewCommentResponseCopyWith(
          NewCommentResponse value, $Res Function(NewCommentResponse) then) =
      _$NewCommentResponseCopyWithImpl<$Res, NewCommentResponse>;
  @useResult
  $Res call({Comment data, bool success, String message});

  $CommentCopyWith<$Res> get data;
}

/// @nodoc
class _$NewCommentResponseCopyWithImpl<$Res, $Val extends NewCommentResponse>
    implements $NewCommentResponseCopyWith<$Res> {
  _$NewCommentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Comment,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res> get data {
    return $CommentCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewCommentResponseCopyWith<$Res>
    implements $NewCommentResponseCopyWith<$Res> {
  factory _$$_NewCommentResponseCopyWith(_$_NewCommentResponse value,
          $Res Function(_$_NewCommentResponse) then) =
      __$$_NewCommentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Comment data, bool success, String message});

  @override
  $CommentCopyWith<$Res> get data;
}

/// @nodoc
class __$$_NewCommentResponseCopyWithImpl<$Res>
    extends _$NewCommentResponseCopyWithImpl<$Res, _$_NewCommentResponse>
    implements _$$_NewCommentResponseCopyWith<$Res> {
  __$$_NewCommentResponseCopyWithImpl(
      _$_NewCommentResponse _value, $Res Function(_$_NewCommentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$_NewCommentResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Comment,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewCommentResponse implements _NewCommentResponse {
  _$_NewCommentResponse(
      {required this.data, required this.success, required this.message});

  factory _$_NewCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NewCommentResponseFromJson(json);

  @override
  final Comment data;
  @override
  final bool success;
  @override
  final String message;

  @override
  String toString() {
    return 'NewCommentResponse(data: $data, success: $success, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewCommentResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, success, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewCommentResponseCopyWith<_$_NewCommentResponse> get copyWith =>
      __$$_NewCommentResponseCopyWithImpl<_$_NewCommentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewCommentResponseToJson(
      this,
    );
  }
}

abstract class _NewCommentResponse implements NewCommentResponse {
  factory _NewCommentResponse(
      {required final Comment data,
      required final bool success,
      required final String message}) = _$_NewCommentResponse;

  factory _NewCommentResponse.fromJson(Map<String, dynamic> json) =
      _$_NewCommentResponse.fromJson;

  @override
  Comment get data;
  @override
  bool get success;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NewCommentResponseCopyWith<_$_NewCommentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
