// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) {
  return _PaginationRequest.fromJson(json);
}

/// @nodoc
mixin _$PaginationRequest {
  @JsonKey(name: "page")
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: "per_page")
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: "q")
  String? get q => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationRequestCopyWith<PaginationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationRequestCopyWith<$Res> {
  factory $PaginationRequestCopyWith(
          PaginationRequest value, $Res Function(PaginationRequest) then) =
      _$PaginationRequestCopyWithImpl<$Res, PaginationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "page") int page,
      @JsonKey(name: "per_page") int perPage,
      @JsonKey(name: "q") String? q});
}

/// @nodoc
class _$PaginationRequestCopyWithImpl<$Res, $Val extends PaginationRequest>
    implements $PaginationRequestCopyWith<$Res> {
  _$PaginationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? q = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationRequestCopyWith<$Res>
    implements $PaginationRequestCopyWith<$Res> {
  factory _$$_PaginationRequestCopyWith(_$_PaginationRequest value,
          $Res Function(_$_PaginationRequest) then) =
      __$$_PaginationRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "page") int page,
      @JsonKey(name: "per_page") int perPage,
      @JsonKey(name: "q") String? q});
}

/// @nodoc
class __$$_PaginationRequestCopyWithImpl<$Res>
    extends _$PaginationRequestCopyWithImpl<$Res, _$_PaginationRequest>
    implements _$$_PaginationRequestCopyWith<$Res> {
  __$$_PaginationRequestCopyWithImpl(
      _$_PaginationRequest _value, $Res Function(_$_PaginationRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? q = freezed,
  }) {
    return _then(_$_PaginationRequest(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
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
class _$_PaginationRequest implements _PaginationRequest {
  _$_PaginationRequest(
      {@JsonKey(name: "page") required this.page,
      @JsonKey(name: "per_page") required this.perPage,
      @JsonKey(name: "q") this.q});

  factory _$_PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationRequestFromJson(json);

  @override
  @JsonKey(name: "page")
  final int page;
  @override
  @JsonKey(name: "per_page")
  final int perPage;
  @override
  @JsonKey(name: "q")
  final String? q;

  @override
  String toString() {
    return 'PaginationRequest(page: $page, perPage: $perPage, q: $q)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationRequest &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.q, q) || other.q == q));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage, q);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationRequestCopyWith<_$_PaginationRequest> get copyWith =>
      __$$_PaginationRequestCopyWithImpl<_$_PaginationRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationRequestToJson(
      this,
    );
  }
}

abstract class _PaginationRequest implements PaginationRequest {
  factory _PaginationRequest(
      {@JsonKey(name: "page") required final int page,
      @JsonKey(name: "per_page") required final int perPage,
      @JsonKey(name: "q") final String? q}) = _$_PaginationRequest;

  factory _PaginationRequest.fromJson(Map<String, dynamic> json) =
      _$_PaginationRequest.fromJson;

  @override
  @JsonKey(name: "page")
  int get page;
  @override
  @JsonKey(name: "per_page")
  int get perPage;
  @override
  @JsonKey(name: "q")
  String? get q;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationRequestCopyWith<_$_PaginationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
