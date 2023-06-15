// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsRequest _$NotificationsRequestFromJson(Map<String, dynamic> json) {
  return _NotificationsRequest.fromJson(json);
}

/// @nodoc
mixin _$NotificationsRequest {
  @JsonKey(name: "per_page")
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: "q")
  String? get q => throw _privateConstructorUsedError;
  @JsonKey(name: "filter")
  String? get filter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsRequestCopyWith<NotificationsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsRequestCopyWith<$Res> {
  factory $NotificationsRequestCopyWith(NotificationsRequest value,
          $Res Function(NotificationsRequest) then) =
      _$NotificationsRequestCopyWithImpl<$Res, NotificationsRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "per_page") int perPage,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "q") String? q,
      @JsonKey(name: "filter") String? filter});
}

/// @nodoc
class _$NotificationsRequestCopyWithImpl<$Res,
        $Val extends NotificationsRequest>
    implements $NotificationsRequestCopyWith<$Res> {
  _$NotificationsRequestCopyWithImpl(this._value, this._then);

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
    Object? filter = freezed,
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
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationsRequestCopyWith<$Res>
    implements $NotificationsRequestCopyWith<$Res> {
  factory _$$_NotificationsRequestCopyWith(_$_NotificationsRequest value,
          $Res Function(_$_NotificationsRequest) then) =
      __$$_NotificationsRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "per_page") int perPage,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "q") String? q,
      @JsonKey(name: "filter") String? filter});
}

/// @nodoc
class __$$_NotificationsRequestCopyWithImpl<$Res>
    extends _$NotificationsRequestCopyWithImpl<$Res, _$_NotificationsRequest>
    implements _$$_NotificationsRequestCopyWith<$Res> {
  __$$_NotificationsRequestCopyWithImpl(_$_NotificationsRequest _value,
      $Res Function(_$_NotificationsRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = null,
    Object? page = null,
    Object? q = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$_NotificationsRequest(
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
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsRequest implements _NotificationsRequest {
  _$_NotificationsRequest(
      {@JsonKey(name: "per_page") required this.perPage,
      @JsonKey(name: "page") required this.page,
      @JsonKey(name: "q") this.q,
      @JsonKey(name: "filter") this.filter});

  factory _$_NotificationsRequest.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsRequestFromJson(json);

  @override
  @JsonKey(name: "per_page")
  final int perPage;
  @override
  @JsonKey(name: "page")
  final int page;
  @override
  @JsonKey(name: "q")
  final String? q;
  @override
  @JsonKey(name: "filter")
  final String? filter;

  @override
  String toString() {
    return 'NotificationsRequest(perPage: $perPage, page: $page, q: $q, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsRequest &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, perPage, page, q, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsRequestCopyWith<_$_NotificationsRequest> get copyWith =>
      __$$_NotificationsRequestCopyWithImpl<_$_NotificationsRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsRequestToJson(
      this,
    );
  }
}

abstract class _NotificationsRequest implements NotificationsRequest {
  factory _NotificationsRequest(
      {@JsonKey(name: "per_page") required final int perPage,
      @JsonKey(name: "page") required final int page,
      @JsonKey(name: "q") final String? q,
      @JsonKey(name: "filter") final String? filter}) = _$_NotificationsRequest;

  factory _NotificationsRequest.fromJson(Map<String, dynamic> json) =
      _$_NotificationsRequest.fromJson;

  @override
  @JsonKey(name: "per_page")
  int get perPage;
  @override
  @JsonKey(name: "page")
  int get page;
  @override
  @JsonKey(name: "q")
  String? get q;
  @override
  @JsonKey(name: "filter")
  String? get filter;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsRequestCopyWith<_$_NotificationsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
