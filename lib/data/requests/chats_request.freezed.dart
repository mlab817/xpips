// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatsRequest _$ChatsRequestFromJson(Map<String, dynamic> json) {
  return _ChatsRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatsRequest {
  @JsonKey(name: "per_page")
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: "q", includeIfNull: true)
  String? get q => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatsRequestCopyWith<ChatsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsRequestCopyWith<$Res> {
  factory $ChatsRequestCopyWith(
          ChatsRequest value, $Res Function(ChatsRequest) then) =
      _$ChatsRequestCopyWithImpl<$Res, ChatsRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "per_page") int perPage,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "q", includeIfNull: true) String? q});
}

/// @nodoc
class _$ChatsRequestCopyWithImpl<$Res, $Val extends ChatsRequest>
    implements $ChatsRequestCopyWith<$Res> {
  _$ChatsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = null,
    Object? page = null,
    Object? q = freezed,
  }) {
    return _then(_value.copyWith(
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatsRequestCopyWith<$Res>
    implements $ChatsRequestCopyWith<$Res> {
  factory _$$_ChatsRequestCopyWith(
          _$_ChatsRequest value, $Res Function(_$_ChatsRequest) then) =
      __$$_ChatsRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "per_page") int perPage,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "q", includeIfNull: true) String? q});
}

/// @nodoc
class __$$_ChatsRequestCopyWithImpl<$Res>
    extends _$ChatsRequestCopyWithImpl<$Res, _$_ChatsRequest>
    implements _$$_ChatsRequestCopyWith<$Res> {
  __$$_ChatsRequestCopyWithImpl(
      _$_ChatsRequest _value, $Res Function(_$_ChatsRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = null,
    Object? page = null,
    Object? q = freezed,
  }) {
    return _then(_$_ChatsRequest(
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatsRequest implements _ChatsRequest {
  _$_ChatsRequest(
      {@JsonKey(name: "per_page") required this.perPage,
      @JsonKey(name: "page") required this.page,
      @JsonKey(name: "q", includeIfNull: true) this.q});

  factory _$_ChatsRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ChatsRequestFromJson(json);

  @override
  @JsonKey(name: "per_page")
  final int perPage;
  @override
  @JsonKey(name: "page")
  final int page;
  @override
  @JsonKey(name: "q", includeIfNull: true)
  final String? q;

  @override
  String toString() {
    return 'ChatsRequest(perPage: $perPage, page: $page, q: $q)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatsRequest &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.q, q) || other.q == q));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, perPage, page, q);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatsRequestCopyWith<_$_ChatsRequest> get copyWith =>
      __$$_ChatsRequestCopyWithImpl<_$_ChatsRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatsRequestToJson(
      this,
    );
  }
}

abstract class _ChatsRequest implements ChatsRequest {
  factory _ChatsRequest(
          {@JsonKey(name: "per_page") required final int perPage,
          @JsonKey(name: "page") required final int page,
          @JsonKey(name: "q", includeIfNull: true) final String? q}) =
      _$_ChatsRequest;

  factory _ChatsRequest.fromJson(Map<String, dynamic> json) =
      _$_ChatsRequest.fromJson;

  @override
  @JsonKey(name: "per_page")
  int get perPage;
  @override
  @JsonKey(name: "page")
  int get page;
  @override
  @JsonKey(name: "q", includeIfNull: true)
  String? get q;
  @override
  @JsonKey(ignore: true)
  _$$_ChatsRequestCopyWith<_$_ChatsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
