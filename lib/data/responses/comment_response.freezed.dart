// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) {
  return _CommentResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentResponse {
  Comment get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentResponseCopyWith<CommentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentResponseCopyWith<$Res> {
  factory $CommentResponseCopyWith(
          CommentResponse value, $Res Function(CommentResponse) then) =
      _$CommentResponseCopyWithImpl<$Res, CommentResponse>;
  @useResult
  $Res call({Comment comment});

  $CommentCopyWith<$Res> get comment;
}

/// @nodoc
class _$CommentResponseCopyWithImpl<$Res, $Val extends CommentResponse>
    implements $CommentResponseCopyWith<$Res> {
  _$CommentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res> get comment {
    return $CommentCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentResponseCopyWith<$Res>
    implements $CommentResponseCopyWith<$Res> {
  factory _$$_CommentResponseCopyWith(
          _$_CommentResponse value, $Res Function(_$_CommentResponse) then) =
      __$$_CommentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Comment comment});

  @override
  $CommentCopyWith<$Res> get comment;
}

/// @nodoc
class __$$_CommentResponseCopyWithImpl<$Res>
    extends _$CommentResponseCopyWithImpl<$Res, _$_CommentResponse>
    implements _$$_CommentResponseCopyWith<$Res> {
  __$$_CommentResponseCopyWithImpl(
      _$_CommentResponse _value, $Res Function(_$_CommentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$_CommentResponse(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentResponse implements _CommentResponse {
  _$_CommentResponse({required this.comment});

  factory _$_CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CommentResponseFromJson(json);

  @override
  final Comment comment;

  @override
  String toString() {
    return 'CommentResponse(comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentResponse &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentResponseCopyWith<_$_CommentResponse> get copyWith =>
      __$$_CommentResponseCopyWithImpl<_$_CommentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentResponseToJson(
      this,
    );
  }
}

abstract class _CommentResponse implements CommentResponse {
  factory _CommentResponse({required final Comment comment}) =
      _$_CommentResponse;

  factory _CommentResponse.fromJson(Map<String, dynamic> json) =
      _$_CommentResponse.fromJson;

  @override
  Comment get comment;
  @override
  @JsonKey(ignore: true)
  _$$_CommentResponseCopyWith<_$_CommentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
