// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pipsstatus_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PipsStatusResponse _$PipsStatusResponseFromJson(Map<String, dynamic> json) {
  return _PipsStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$PipsStatusResponse {
  List<PipsStatus> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PipsStatusResponseCopyWith<PipsStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PipsStatusResponseCopyWith<$Res> {
  factory $PipsStatusResponseCopyWith(
          PipsStatusResponse value, $Res Function(PipsStatusResponse) then) =
      _$PipsStatusResponseCopyWithImpl<$Res, PipsStatusResponse>;
  @useResult
  $Res call({List<PipsStatus> data});
}

/// @nodoc
class _$PipsStatusResponseCopyWithImpl<$Res, $Val extends PipsStatusResponse>
    implements $PipsStatusResponseCopyWith<$Res> {
  _$PipsStatusResponseCopyWithImpl(this._value, this._then);

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
              as List<PipsStatus>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PipsStatusResponseCopyWith<$Res>
    implements $PipsStatusResponseCopyWith<$Res> {
  factory _$$_PipsStatusResponseCopyWith(_$_PipsStatusResponse value,
          $Res Function(_$_PipsStatusResponse) then) =
      __$$_PipsStatusResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PipsStatus> data});
}

/// @nodoc
class __$$_PipsStatusResponseCopyWithImpl<$Res>
    extends _$PipsStatusResponseCopyWithImpl<$Res, _$_PipsStatusResponse>
    implements _$$_PipsStatusResponseCopyWith<$Res> {
  __$$_PipsStatusResponseCopyWithImpl(
      _$_PipsStatusResponse _value, $Res Function(_$_PipsStatusResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_PipsStatusResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PipsStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PipsStatusResponse implements _PipsStatusResponse {
  _$_PipsStatusResponse({required final List<PipsStatus> data}) : _data = data;

  factory _$_PipsStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PipsStatusResponseFromJson(json);

  final List<PipsStatus> _data;
  @override
  List<PipsStatus> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PipsStatusResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PipsStatusResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PipsStatusResponseCopyWith<_$_PipsStatusResponse> get copyWith =>
      __$$_PipsStatusResponseCopyWithImpl<_$_PipsStatusResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PipsStatusResponseToJson(
      this,
    );
  }
}

abstract class _PipsStatusResponse implements PipsStatusResponse {
  factory _PipsStatusResponse({required final List<PipsStatus> data}) =
      _$_PipsStatusResponse;

  factory _PipsStatusResponse.fromJson(Map<String, dynamic> json) =
      _$_PipsStatusResponse.fromJson;

  @override
  List<PipsStatus> get data;
  @override
  @JsonKey(ignore: true)
  _$$_PipsStatusResponseCopyWith<_$_PipsStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
