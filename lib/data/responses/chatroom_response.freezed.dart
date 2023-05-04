// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatroom_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomResponse _$ChatRoomResponseFromJson(Map<String, dynamic> json) {
  return _ChatRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomResponse {
  @JsonKey(name: "data")
  ChatRoom get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomResponseCopyWith<ChatRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomResponseCopyWith<$Res> {
  factory $ChatRoomResponseCopyWith(
          ChatRoomResponse value, $Res Function(ChatRoomResponse) then) =
      _$ChatRoomResponseCopyWithImpl<$Res, ChatRoomResponse>;
  @useResult
  $Res call({@JsonKey(name: "data") ChatRoom data});

  $ChatRoomCopyWith<$Res> get data;
}

/// @nodoc
class _$ChatRoomResponseCopyWithImpl<$Res, $Val extends ChatRoomResponse>
    implements $ChatRoomResponseCopyWith<$Res> {
  _$ChatRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChatRoom,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatRoomCopyWith<$Res> get data {
    return $ChatRoomCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatRoomResponseCopyWith<$Res>
    implements $ChatRoomResponseCopyWith<$Res> {
  factory _$$_ChatRoomResponseCopyWith(
          _$_ChatRoomResponse value, $Res Function(_$_ChatRoomResponse) then) =
      __$$_ChatRoomResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "data") ChatRoom data});

  @override
  $ChatRoomCopyWith<$Res> get data;
}

/// @nodoc
class __$$_ChatRoomResponseCopyWithImpl<$Res>
    extends _$ChatRoomResponseCopyWithImpl<$Res, _$_ChatRoomResponse>
    implements _$$_ChatRoomResponseCopyWith<$Res> {
  __$$_ChatRoomResponseCopyWithImpl(
      _$_ChatRoomResponse _value, $Res Function(_$_ChatRoomResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_ChatRoomResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChatRoom,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoomResponse implements _ChatRoomResponse {
  _$_ChatRoomResponse({@JsonKey(name: "data") required this.data});

  factory _$_ChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomResponseFromJson(json);

  @override
  @JsonKey(name: "data")
  final ChatRoom data;

  @override
  String toString() {
    return 'ChatRoomResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoomResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomResponseCopyWith<_$_ChatRoomResponse> get copyWith =>
      __$$_ChatRoomResponseCopyWithImpl<_$_ChatRoomResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomResponseToJson(
      this,
    );
  }
}

abstract class _ChatRoomResponse implements ChatRoomResponse {
  factory _ChatRoomResponse(
          {@JsonKey(name: "data") required final ChatRoom data}) =
      _$_ChatRoomResponse;

  factory _ChatRoomResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatRoomResponse.fromJson;

  @override
  @JsonKey(name: "data")
  ChatRoom get data;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomResponseCopyWith<_$_ChatRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
