// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginCredentials _$LoginCredentialsFromJson(Map<String, dynamic> json) {
  return _LoginCredentials.fromJson(json);
}

/// @nodoc
mixin _$LoginCredentials {
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginCredentialsCopyWith<LoginCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCredentialsCopyWith<$Res> {
  factory $LoginCredentialsCopyWith(
          LoginCredentials value, $Res Function(LoginCredentials) then) =
      _$LoginCredentialsCopyWithImpl<$Res, LoginCredentials>;
  @useResult
  $Res call(
      {@JsonKey(name: "username") String username,
      @JsonKey(name: "password") String password});
}

/// @nodoc
class _$LoginCredentialsCopyWithImpl<$Res, $Val extends LoginCredentials>
    implements $LoginCredentialsCopyWith<$Res> {
  _$LoginCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginCredentialsCopyWith<$Res>
    implements $LoginCredentialsCopyWith<$Res> {
  factory _$$_LoginCredentialsCopyWith(
          _$_LoginCredentials value, $Res Function(_$_LoginCredentials) then) =
      __$$_LoginCredentialsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "username") String username,
      @JsonKey(name: "password") String password});
}

/// @nodoc
class __$$_LoginCredentialsCopyWithImpl<$Res>
    extends _$LoginCredentialsCopyWithImpl<$Res, _$_LoginCredentials>
    implements _$$_LoginCredentialsCopyWith<$Res> {
  __$$_LoginCredentialsCopyWithImpl(
      _$_LoginCredentials _value, $Res Function(_$_LoginCredentials) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_LoginCredentials(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginCredentials implements _LoginCredentials {
  _$_LoginCredentials(
      {@JsonKey(name: "username") required this.username,
      @JsonKey(name: "password") required this.password});

  factory _$_LoginCredentials.fromJson(Map<String, dynamic> json) =>
      _$$_LoginCredentialsFromJson(json);

  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "password")
  final String password;

  @override
  String toString() {
    return 'LoginCredentials(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginCredentials &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginCredentialsCopyWith<_$_LoginCredentials> get copyWith =>
      __$$_LoginCredentialsCopyWithImpl<_$_LoginCredentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginCredentialsToJson(
      this,
    );
  }
}

abstract class _LoginCredentials implements LoginCredentials {
  factory _LoginCredentials(
          {@JsonKey(name: "username") required final String username,
          @JsonKey(name: "password") required final String password}) =
      _$_LoginCredentials;

  factory _LoginCredentials.fromJson(Map<String, dynamic> json) =
      _$_LoginCredentials.fromJson;

  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "password")
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginCredentialsCopyWith<_$_LoginCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}
