// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'options_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OptionsResponse _$OptionsResponseFromJson(Map<String, dynamic> json) {
  return _OptionsResponse.fromJson(json);
}

/// @nodoc
mixin _$OptionsResponse {
  FormOptions get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionsResponseCopyWith<OptionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionsResponseCopyWith<$Res> {
  factory $OptionsResponseCopyWith(
          OptionsResponse value, $Res Function(OptionsResponse) then) =
      _$OptionsResponseCopyWithImpl<$Res, OptionsResponse>;
  @useResult
  $Res call({FormOptions data});

  $FormOptionsCopyWith<$Res> get data;
}

/// @nodoc
class _$OptionsResponseCopyWithImpl<$Res, $Val extends OptionsResponse>
    implements $OptionsResponseCopyWith<$Res> {
  _$OptionsResponseCopyWithImpl(this._value, this._then);

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
              as FormOptions,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormOptionsCopyWith<$Res> get data {
    return $FormOptionsCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OptionsResponseCopyWith<$Res>
    implements $OptionsResponseCopyWith<$Res> {
  factory _$$_OptionsResponseCopyWith(
          _$_OptionsResponse value, $Res Function(_$_OptionsResponse) then) =
      __$$_OptionsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormOptions data});

  @override
  $FormOptionsCopyWith<$Res> get data;
}

/// @nodoc
class __$$_OptionsResponseCopyWithImpl<$Res>
    extends _$OptionsResponseCopyWithImpl<$Res, _$_OptionsResponse>
    implements _$$_OptionsResponseCopyWith<$Res> {
  __$$_OptionsResponseCopyWithImpl(
      _$_OptionsResponse _value, $Res Function(_$_OptionsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_OptionsResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FormOptions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OptionsResponse implements _OptionsResponse {
  _$_OptionsResponse({required this.data});

  factory _$_OptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OptionsResponseFromJson(json);

  @override
  final FormOptions data;

  @override
  String toString() {
    return 'OptionsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptionsResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionsResponseCopyWith<_$_OptionsResponse> get copyWith =>
      __$$_OptionsResponseCopyWithImpl<_$_OptionsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionsResponseToJson(
      this,
    );
  }
}

abstract class _OptionsResponse implements OptionsResponse {
  factory _OptionsResponse({required final FormOptions data}) =
      _$_OptionsResponse;

  factory _OptionsResponse.fromJson(Map<String, dynamic> json) =
      _$_OptionsResponse.fromJson;

  @override
  FormOptions get data;
  @override
  @JsonKey(ignore: true)
  _$$_OptionsResponseCopyWith<_$_OptionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
