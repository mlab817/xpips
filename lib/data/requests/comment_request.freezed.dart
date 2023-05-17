// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentRequest _$CommentRequestFromJson(Map<String, dynamic> json) {
  return _CommentRequest.fromJson(json);
}

/// @nodoc
mixin _$CommentRequest {
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentRequestCopyWith<CommentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentRequestCopyWith<$Res> {
  factory $CommentRequestCopyWith(
          CommentRequest value, $Res Function(CommentRequest) then) =
      _$CommentRequestCopyWithImpl<$Res, CommentRequest>;
  @useResult
  $Res call({String comment});
}

/// @nodoc
class _$CommentRequestCopyWithImpl<$Res, $Val extends CommentRequest>
    implements $CommentRequestCopyWith<$Res> {
  _$CommentRequestCopyWithImpl(this._value, this._then);

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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentRequestCopyWith<$Res>
    implements $CommentRequestCopyWith<$Res> {
  factory _$$_CommentRequestCopyWith(
          _$_CommentRequest value, $Res Function(_$_CommentRequest) then) =
      __$$_CommentRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comment});
}

/// @nodoc
class __$$_CommentRequestCopyWithImpl<$Res>
    extends _$CommentRequestCopyWithImpl<$Res, _$_CommentRequest>
    implements _$$_CommentRequestCopyWith<$Res> {
  __$$_CommentRequestCopyWithImpl(
      _$_CommentRequest _value, $Res Function(_$_CommentRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$_CommentRequest(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentRequest implements _CommentRequest {
  _$_CommentRequest({required this.comment});

  factory _$_CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CommentRequestFromJson(json);

  @override
  final String comment;

  @override
  String toString() {
    return 'CommentRequest(comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentRequest &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentRequestCopyWith<_$_CommentRequest> get copyWith =>
      __$$_CommentRequestCopyWithImpl<_$_CommentRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentRequestToJson(
      this,
    );
  }
}

abstract class _CommentRequest implements CommentRequest {
  factory _CommentRequest({required final String comment}) = _$_CommentRequest;

  factory _CommentRequest.fromJson(Map<String, dynamic> json) =
      _$_CommentRequest.fromJson;

  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$_CommentRequestCopyWith<_$_CommentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
