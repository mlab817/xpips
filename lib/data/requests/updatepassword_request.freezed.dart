// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updatepassword_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdatePasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePasswordRequest {
  @JsonKey(name: "current_password")
  String get currentPassword => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "password_confirmation")
  String get passwordConfirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePasswordRequestCopyWith<UpdatePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestCopyWith(UpdatePasswordRequest value,
          $Res Function(UpdatePasswordRequest) then) =
      _$UpdatePasswordRequestCopyWithImpl<$Res, UpdatePasswordRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "current_password") String currentPassword,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "password_confirmation") String passwordConfirmation});
}

/// @nodoc
class _$UpdatePasswordRequestCopyWithImpl<$Res,
        $Val extends UpdatePasswordRequest>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  _$UpdatePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? password = null,
    Object? passwordConfirmation = null,
  }) {
    return _then(_value.copyWith(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdatePasswordRequestCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory _$$_UpdatePasswordRequestCopyWith(_$_UpdatePasswordRequest value,
          $Res Function(_$_UpdatePasswordRequest) then) =
      __$$_UpdatePasswordRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "current_password") String currentPassword,
      @JsonKey(name: "password") String password,
      @JsonKey(name: "password_confirmation") String passwordConfirmation});
}

/// @nodoc
class __$$_UpdatePasswordRequestCopyWithImpl<$Res>
    extends _$UpdatePasswordRequestCopyWithImpl<$Res, _$_UpdatePasswordRequest>
    implements _$$_UpdatePasswordRequestCopyWith<$Res> {
  __$$_UpdatePasswordRequestCopyWithImpl(_$_UpdatePasswordRequest _value,
      $Res Function(_$_UpdatePasswordRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? password = null,
    Object? passwordConfirmation = null,
  }) {
    return _then(_$_UpdatePasswordRequest(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdatePasswordRequest implements _UpdatePasswordRequest {
  _$_UpdatePasswordRequest(
      {@JsonKey(name: "current_password")
          required this.currentPassword,
      @JsonKey(name: "password")
          required this.password,
      @JsonKey(name: "password_confirmation")
          required this.passwordConfirmation});

  factory _$_UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UpdatePasswordRequestFromJson(json);

  @override
  @JsonKey(name: "current_password")
  final String currentPassword;
  @override
  @JsonKey(name: "password")
  final String password;
  @override
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;

  @override
  String toString() {
    return 'UpdatePasswordRequest(currentPassword: $currentPassword, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePasswordRequest &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPassword, password, passwordConfirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePasswordRequestCopyWith<_$_UpdatePasswordRequest> get copyWith =>
      __$$_UpdatePasswordRequestCopyWithImpl<_$_UpdatePasswordRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatePasswordRequestToJson(
      this,
    );
  }
}

abstract class _UpdatePasswordRequest implements UpdatePasswordRequest {
  factory _UpdatePasswordRequest(
          {@JsonKey(name: "current_password")
              required final String currentPassword,
          @JsonKey(name: "password")
              required final String password,
          @JsonKey(name: "password_confirmation")
              required final String passwordConfirmation}) =
      _$_UpdatePasswordRequest;

  factory _UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$_UpdatePasswordRequest.fromJson;

  @override
  @JsonKey(name: "current_password")
  String get currentPassword;
  @override
  @JsonKey(name: "password")
  String get password;
  @override
  @JsonKey(name: "password_confirmation")
  String get passwordConfirmation;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatePasswordRequestCopyWith<_$_UpdatePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
