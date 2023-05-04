// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newmessage_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewMessageRequest _$NewMessageRequestFromJson(Map<String, dynamic> json) {
  return _NewMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$NewMessageRequest {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewMessageRequestCopyWith<NewMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewMessageRequestCopyWith<$Res> {
  factory $NewMessageRequestCopyWith(
          NewMessageRequest value, $Res Function(NewMessageRequest) then) =
      _$NewMessageRequestCopyWithImpl<$Res, NewMessageRequest>;
  @useResult
  $Res call({int id, String content});
}

/// @nodoc
class _$NewMessageRequestCopyWithImpl<$Res, $Val extends NewMessageRequest>
    implements $NewMessageRequestCopyWith<$Res> {
  _$NewMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewMessageRequestCopyWith<$Res>
    implements $NewMessageRequestCopyWith<$Res> {
  factory _$$_NewMessageRequestCopyWith(_$_NewMessageRequest value,
          $Res Function(_$_NewMessageRequest) then) =
      __$$_NewMessageRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String content});
}

/// @nodoc
class __$$_NewMessageRequestCopyWithImpl<$Res>
    extends _$NewMessageRequestCopyWithImpl<$Res, _$_NewMessageRequest>
    implements _$$_NewMessageRequestCopyWith<$Res> {
  __$$_NewMessageRequestCopyWithImpl(
      _$_NewMessageRequest _value, $Res Function(_$_NewMessageRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
  }) {
    return _then(_$_NewMessageRequest(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewMessageRequest implements _NewMessageRequest {
  _$_NewMessageRequest({required this.id, required this.content});

  factory _$_NewMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$$_NewMessageRequestFromJson(json);

  @override
  final int id;
  @override
  final String content;

  @override
  String toString() {
    return 'NewMessageRequest(id: $id, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewMessageRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewMessageRequestCopyWith<_$_NewMessageRequest> get copyWith =>
      __$$_NewMessageRequestCopyWithImpl<_$_NewMessageRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewMessageRequestToJson(
      this,
    );
  }
}

abstract class _NewMessageRequest implements NewMessageRequest {
  factory _NewMessageRequest(
      {required final int id,
      required final String content}) = _$_NewMessageRequest;

  factory _NewMessageRequest.fromJson(Map<String, dynamic> json) =
      _$_NewMessageRequest.fromJson;

  @override
  int get id;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_NewMessageRequestCopyWith<_$_NewMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
