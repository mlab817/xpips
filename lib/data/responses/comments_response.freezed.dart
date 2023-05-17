// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) {
  return _CommentsResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentsResponse {
  List<Comment> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentsResponseCopyWith<CommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsResponseCopyWith<$Res> {
  factory $CommentsResponseCopyWith(
          CommentsResponse value, $Res Function(CommentsResponse) then) =
      _$CommentsResponseCopyWithImpl<$Res, CommentsResponse>;
  @useResult
  $Res call({List<Comment> data});
}

/// @nodoc
class _$CommentsResponseCopyWithImpl<$Res, $Val extends CommentsResponse>
    implements $CommentsResponseCopyWith<$Res> {
  _$CommentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentsResponseCopyWith<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  factory _$$_CommentsResponseCopyWith(
          _$_CommentsResponse value, $Res Function(_$_CommentsResponse) then) =
      __$$_CommentsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Comment> data});
}

/// @nodoc
class __$$_CommentsResponseCopyWithImpl<$Res>
    extends _$CommentsResponseCopyWithImpl<$Res, _$_CommentsResponse>
    implements _$$_CommentsResponseCopyWith<$Res> {
  __$$_CommentsResponseCopyWithImpl(
      _$_CommentsResponse _value, $Res Function(_$_CommentsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_CommentsResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentsResponse implements _CommentsResponse {
  _$_CommentsResponse({required final List<Comment> data}) : _data = data;

  factory _$_CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CommentsResponseFromJson(json);

  final List<Comment> _data;
  @override
  List<Comment> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CommentsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentsResponseCopyWith<_$_CommentsResponse> get copyWith =>
      __$$_CommentsResponseCopyWithImpl<_$_CommentsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentsResponseToJson(
      this,
    );
  }
}

abstract class _CommentsResponse implements CommentsResponse {
  factory _CommentsResponse({required final List<Comment> data}) =
      _$_CommentsResponse;

  factory _CommentsResponse.fromJson(Map<String, dynamic> json) =
      _$_CommentsResponse.fromJson;

  @override
  List<Comment> get data;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsResponseCopyWith<_$_CommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
