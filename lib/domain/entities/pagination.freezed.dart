// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  @JsonKey(name: "total")
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: "pageSize")
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "current")
  int get current => throw _privateConstructorUsedError;
  @JsonKey(name: "last")
  int get last => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call(
      {@JsonKey(name: "total") int total,
      @JsonKey(name: "pageSize") int pageSize,
      @JsonKey(name: "current") int current,
      @JsonKey(name: "last") int last});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pageSize = null,
    Object? current = null,
    Object? last = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$_PaginationCopyWith(
          _$_Pagination value, $Res Function(_$_Pagination) then) =
      __$$_PaginationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total") int total,
      @JsonKey(name: "pageSize") int pageSize,
      @JsonKey(name: "current") int current,
      @JsonKey(name: "last") int last});
}

/// @nodoc
class __$$_PaginationCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$_Pagination>
    implements _$$_PaginationCopyWith<$Res> {
  __$$_PaginationCopyWithImpl(
      _$_Pagination _value, $Res Function(_$_Pagination) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pageSize = null,
    Object? current = null,
    Object? last = null,
  }) {
    return _then(_$_Pagination(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pagination implements _Pagination {
  _$_Pagination(
      {@JsonKey(name: "total") required this.total,
      @JsonKey(name: "pageSize") required this.pageSize,
      @JsonKey(name: "current") required this.current,
      @JsonKey(name: "last") required this.last});

  factory _$_Pagination.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationFromJson(json);

  @override
  @JsonKey(name: "total")
  final int total;
  @override
  @JsonKey(name: "pageSize")
  final int pageSize;
  @override
  @JsonKey(name: "current")
  final int current;
  @override
  @JsonKey(name: "last")
  final int last;

  @override
  String toString() {
    return 'Pagination(total: $total, pageSize: $pageSize, current: $current, last: $last)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pagination &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, pageSize, current, last);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      __$$_PaginationCopyWithImpl<_$_Pagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  factory _Pagination(
      {@JsonKey(name: "total") required final int total,
      @JsonKey(name: "pageSize") required final int pageSize,
      @JsonKey(name: "current") required final int current,
      @JsonKey(name: "last") required final int last}) = _$_Pagination;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$_Pagination.fromJson;

  @override
  @JsonKey(name: "total")
  int get total;
  @override
  @JsonKey(name: "pageSize")
  int get pageSize;
  @override
  @JsonKey(name: "current")
  int get current;
  @override
  @JsonKey(name: "last")
  int get last;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}
