// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updateprofile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateProfileResponse _$UpdateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return _UpdateProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileResponse {
  bool get success => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProfileResponseCopyWith<UpdateProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileResponseCopyWith<$Res> {
  factory $UpdateProfileResponseCopyWith(UpdateProfileResponse value,
          $Res Function(UpdateProfileResponse) then) =
      _$UpdateProfileResponseCopyWithImpl<$Res, UpdateProfileResponse>;
  @useResult
  $Res call({bool success, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UpdateProfileResponseCopyWithImpl<$Res,
        $Val extends UpdateProfileResponse>
    implements $UpdateProfileResponseCopyWith<$Res> {
  _$UpdateProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UpdateProfileResponseCopyWith<$Res>
    implements $UpdateProfileResponseCopyWith<$Res> {
  factory _$$_UpdateProfileResponseCopyWith(_$_UpdateProfileResponse value,
          $Res Function(_$_UpdateProfileResponse) then) =
      __$$_UpdateProfileResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UpdateProfileResponseCopyWithImpl<$Res>
    extends _$UpdateProfileResponseCopyWithImpl<$Res, _$_UpdateProfileResponse>
    implements _$$_UpdateProfileResponseCopyWith<$Res> {
  __$$_UpdateProfileResponseCopyWithImpl(_$_UpdateProfileResponse _value,
      $Res Function(_$_UpdateProfileResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? user = null,
  }) {
    return _then(_$_UpdateProfileResponse(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateProfileResponse implements _UpdateProfileResponse {
  _$_UpdateProfileResponse({required this.success, required this.user});

  factory _$_UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateProfileResponseFromJson(json);

  @override
  final bool success;
  @override
  final User user;

  @override
  String toString() {
    return 'UpdateProfileResponse(success: $success, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProfileResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateProfileResponseCopyWith<_$_UpdateProfileResponse> get copyWith =>
      __$$_UpdateProfileResponseCopyWithImpl<_$_UpdateProfileResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateProfileResponseToJson(
      this,
    );
  }
}

abstract class _UpdateProfileResponse implements UpdateProfileResponse {
  factory _UpdateProfileResponse(
      {required final bool success,
      required final User user}) = _$_UpdateProfileResponse;

  factory _UpdateProfileResponse.fromJson(Map<String, dynamic> json) =
      _$_UpdateProfileResponse.fromJson;

  @override
  bool get success;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateProfileResponseCopyWith<_$_UpdateProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
