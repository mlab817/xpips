// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reactivation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReactivationRequest _$ReactivationRequestFromJson(Map<String, dynamic> json) {
  return _ReactivationRequest.fromJson(json);
}

/// @nodoc
mixin _$ReactivationRequest {
  String get email => throw _privateConstructorUsedError;
  String get authorization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReactivationRequestCopyWith<ReactivationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactivationRequestCopyWith<$Res> {
  factory $ReactivationRequestCopyWith(
          ReactivationRequest value, $Res Function(ReactivationRequest) then) =
      _$ReactivationRequestCopyWithImpl<$Res, ReactivationRequest>;
  @useResult
  $Res call({String email, String authorization});
}

/// @nodoc
class _$ReactivationRequestCopyWithImpl<$Res, $Val extends ReactivationRequest>
    implements $ReactivationRequestCopyWith<$Res> {
  _$ReactivationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? authorization = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      authorization: null == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReactivationRequestCopyWith<$Res>
    implements $ReactivationRequestCopyWith<$Res> {
  factory _$$_ReactivationRequestCopyWith(_$_ReactivationRequest value,
          $Res Function(_$_ReactivationRequest) then) =
      __$$_ReactivationRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String authorization});
}

/// @nodoc
class __$$_ReactivationRequestCopyWithImpl<$Res>
    extends _$ReactivationRequestCopyWithImpl<$Res, _$_ReactivationRequest>
    implements _$$_ReactivationRequestCopyWith<$Res> {
  __$$_ReactivationRequestCopyWithImpl(_$_ReactivationRequest _value,
      $Res Function(_$_ReactivationRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? authorization = null,
  }) {
    return _then(_$_ReactivationRequest(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      authorization: null == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReactivationRequest implements _ReactivationRequest {
  _$_ReactivationRequest({required this.email, required this.authorization});

  factory _$_ReactivationRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ReactivationRequestFromJson(json);

  @override
  final String email;
  @override
  final String authorization;

  @override
  String toString() {
    return 'ReactivationRequest(email: $email, authorization: $authorization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReactivationRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.authorization, authorization) ||
                other.authorization == authorization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, authorization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReactivationRequestCopyWith<_$_ReactivationRequest> get copyWith =>
      __$$_ReactivationRequestCopyWithImpl<_$_ReactivationRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReactivationRequestToJson(
      this,
    );
  }
}

abstract class _ReactivationRequest implements ReactivationRequest {
  factory _ReactivationRequest(
      {required final String email,
      required final String authorization}) = _$_ReactivationRequest;

  factory _ReactivationRequest.fromJson(Map<String, dynamic> json) =
      _$_ReactivationRequest.fromJson;

  @override
  String get email;
  @override
  String get authorization;
  @override
  @JsonKey(ignore: true)
  _$$_ReactivationRequestCopyWith<_$_ReactivationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
