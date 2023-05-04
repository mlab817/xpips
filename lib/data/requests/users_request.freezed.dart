// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersRequest _$UsersRequestFromJson(Map<String, dynamic> json) {
  return _UsersRequest.fromJson(json);
}

/// @nodoc
mixin _$UsersRequest {
  @JsonKey(name: "per_page")
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersRequestCopyWith<UsersRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersRequestCopyWith<$Res> {
  factory $UsersRequestCopyWith(
          UsersRequest value, $Res Function(UsersRequest) then) =
      _$UsersRequestCopyWithImpl<$Res, UsersRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "per_page") int? perPage,
      @JsonKey(name: "page") int? page});
}

/// @nodoc
class _$UsersRequestCopyWithImpl<$Res, $Val extends UsersRequest>
    implements $UsersRequestCopyWith<$Res> {
  _$UsersRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersRequestCopyWith<$Res>
    implements $UsersRequestCopyWith<$Res> {
  factory _$$_UsersRequestCopyWith(
          _$_UsersRequest value, $Res Function(_$_UsersRequest) then) =
      __$$_UsersRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "per_page") int? perPage,
      @JsonKey(name: "page") int? page});
}

/// @nodoc
class __$$_UsersRequestCopyWithImpl<$Res>
    extends _$UsersRequestCopyWithImpl<$Res, _$_UsersRequest>
    implements _$$_UsersRequestCopyWith<$Res> {
  __$$_UsersRequestCopyWithImpl(
      _$_UsersRequest _value, $Res Function(_$_UsersRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = freezed,
    Object? page = freezed,
  }) {
    return _then(_$_UsersRequest(
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersRequest implements _UsersRequest {
  _$_UsersRequest(
      {@JsonKey(name: "per_page") this.perPage,
      @JsonKey(name: "page") this.page});

  factory _$_UsersRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UsersRequestFromJson(json);

  @override
  @JsonKey(name: "per_page")
  final int? perPage;
  @override
  @JsonKey(name: "page")
  final int? page;

  @override
  String toString() {
    return 'UsersRequest(perPage: $perPage, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersRequest &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, perPage, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersRequestCopyWith<_$_UsersRequest> get copyWith =>
      __$$_UsersRequestCopyWithImpl<_$_UsersRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersRequestToJson(
      this,
    );
  }
}

abstract class _UsersRequest implements UsersRequest {
  factory _UsersRequest(
      {@JsonKey(name: "per_page") final int? perPage,
      @JsonKey(name: "page") final int? page}) = _$_UsersRequest;

  factory _UsersRequest.fromJson(Map<String, dynamic> json) =
      _$_UsersRequest.fromJson;

  @override
  @JsonKey(name: "per_page")
  int? get perPage;
  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$_UsersRequestCopyWith<_$_UsersRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
