// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reactivation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReactivationResponse _$ReactivationResponseFromJson(Map<String, dynamic> json) {
  return _ReactivationResponse.fromJson(json);
}

/// @nodoc
mixin _$ReactivationResponse {
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReactivationResponseCopyWith<ReactivationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactivationResponseCopyWith<$Res> {
  factory $ReactivationResponseCopyWith(ReactivationResponse value,
          $Res Function(ReactivationResponse) then) =
      _$ReactivationResponseCopyWithImpl<$Res, ReactivationResponse>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$ReactivationResponseCopyWithImpl<$Res,
        $Val extends ReactivationResponse>
    implements $ReactivationResponseCopyWith<$Res> {
  _$ReactivationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReactivationResponseCopyWith<$Res>
    implements $ReactivationResponseCopyWith<$Res> {
  factory _$$_ReactivationResponseCopyWith(_$_ReactivationResponse value,
          $Res Function(_$_ReactivationResponse) then) =
      __$$_ReactivationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$_ReactivationResponseCopyWithImpl<$Res>
    extends _$ReactivationResponseCopyWithImpl<$Res, _$_ReactivationResponse>
    implements _$$_ReactivationResponseCopyWith<$Res> {
  __$$_ReactivationResponseCopyWithImpl(_$_ReactivationResponse _value,
      $Res Function(_$_ReactivationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_ReactivationResponse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReactivationResponse implements _ReactivationResponse {
  _$_ReactivationResponse({required this.status});

  factory _$_ReactivationResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ReactivationResponseFromJson(json);

  @override
  final String status;

  @override
  String toString() {
    return 'ReactivationResponse(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReactivationResponse &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReactivationResponseCopyWith<_$_ReactivationResponse> get copyWith =>
      __$$_ReactivationResponseCopyWithImpl<_$_ReactivationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReactivationResponseToJson(
      this,
    );
  }
}

abstract class _ReactivationResponse implements ReactivationResponse {
  factory _ReactivationResponse({required final String status}) =
      _$_ReactivationResponse;

  factory _ReactivationResponse.fromJson(Map<String, dynamic> json) =
      _$_ReactivationResponse.fromJson;

  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_ReactivationResponseCopyWith<_$_ReactivationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
