// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatrooms_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomsResponse _$ChatRoomsResponseFromJson(Map<String, dynamic> json) {
  return _ChatRoomsResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomsResponse {
  @JsonKey(name: "data")
  List<ChatRoom> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomsResponseCopyWith<ChatRoomsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsResponseCopyWith<$Res> {
  factory $ChatRoomsResponseCopyWith(
          ChatRoomsResponse value, $Res Function(ChatRoomsResponse) then) =
      _$ChatRoomsResponseCopyWithImpl<$Res, ChatRoomsResponse>;
  @useResult
  $Res call({@JsonKey(name: "data") List<ChatRoom> data});
}

/// @nodoc
class _$ChatRoomsResponseCopyWithImpl<$Res, $Val extends ChatRoomsResponse>
    implements $ChatRoomsResponseCopyWith<$Res> {
  _$ChatRoomsResponseCopyWithImpl(this._value, this._then);

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
              as List<ChatRoom>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRoomsResponseCopyWith<$Res>
    implements $ChatRoomsResponseCopyWith<$Res> {
  factory _$$_ChatRoomsResponseCopyWith(_$_ChatRoomsResponse value,
          $Res Function(_$_ChatRoomsResponse) then) =
      __$$_ChatRoomsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "data") List<ChatRoom> data});
}

/// @nodoc
class __$$_ChatRoomsResponseCopyWithImpl<$Res>
    extends _$ChatRoomsResponseCopyWithImpl<$Res, _$_ChatRoomsResponse>
    implements _$$_ChatRoomsResponseCopyWith<$Res> {
  __$$_ChatRoomsResponseCopyWithImpl(
      _$_ChatRoomsResponse _value, $Res Function(_$_ChatRoomsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_ChatRoomsResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatRoom>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoomsResponse implements _ChatRoomsResponse {
  _$_ChatRoomsResponse(
      {@JsonKey(name: "data") required final List<ChatRoom> data})
      : _data = data;

  factory _$_ChatRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomsResponseFromJson(json);

  final List<ChatRoom> _data;
  @override
  @JsonKey(name: "data")
  List<ChatRoom> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChatRoomsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoomsResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomsResponseCopyWith<_$_ChatRoomsResponse> get copyWith =>
      __$$_ChatRoomsResponseCopyWithImpl<_$_ChatRoomsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomsResponseToJson(
      this,
    );
  }
}

abstract class _ChatRoomsResponse implements ChatRoomsResponse {
  factory _ChatRoomsResponse(
          {@JsonKey(name: "data") required final List<ChatRoom> data}) =
      _$_ChatRoomsResponse;

  factory _ChatRoomsResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatRoomsResponse.fromJson;

  @override
  @JsonKey(name: "data")
  List<ChatRoom> get data;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomsResponseCopyWith<_$_ChatRoomsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
