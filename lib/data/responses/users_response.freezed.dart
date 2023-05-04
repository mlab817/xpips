// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) {
  return _UsersResponse.fromJson(json);
}

/// @nodoc
mixin _$UsersResponse {
  List<User> get data => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersResponseCopyWith<UsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersResponseCopyWith<$Res> {
  factory $UsersResponseCopyWith(
          UsersResponse value, $Res Function(UsersResponse) then) =
      _$UsersResponseCopyWithImpl<$Res, UsersResponse>;
  @useResult
  $Res call({List<User> data, Meta meta});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$UsersResponseCopyWithImpl<$Res, $Val extends UsersResponse>
    implements $UsersResponseCopyWith<$Res> {
  _$UsersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<User>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UsersResponseCopyWith<$Res>
    implements $UsersResponseCopyWith<$Res> {
  factory _$$_UsersResponseCopyWith(
          _$_UsersResponse value, $Res Function(_$_UsersResponse) then) =
      __$$_UsersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User> data, Meta meta});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$_UsersResponseCopyWithImpl<$Res>
    extends _$UsersResponseCopyWithImpl<$Res, _$_UsersResponse>
    implements _$$_UsersResponseCopyWith<$Res> {
  __$$_UsersResponseCopyWithImpl(
      _$_UsersResponse _value, $Res Function(_$_UsersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$_UsersResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<User>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersResponse implements _UsersResponse {
  _$_UsersResponse({required final List<User> data, required this.meta})
      : _data = data;

  factory _$_UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UsersResponseFromJson(json);

  final List<User> _data;
  @override
  List<User> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final Meta meta;

  @override
  String toString() {
    return 'UsersResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersResponseCopyWith<_$_UsersResponse> get copyWith =>
      __$$_UsersResponseCopyWithImpl<_$_UsersResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersResponseToJson(
      this,
    );
  }
}

abstract class _UsersResponse implements UsersResponse {
  factory _UsersResponse(
      {required final List<User> data,
      required final Meta meta}) = _$_UsersResponse;

  factory _UsersResponse.fromJson(Map<String, dynamic> json) =
      _$_UsersResponse.fromJson;

  @override
  List<User> get data;
  @override
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$_UsersResponseCopyWith<_$_UsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
