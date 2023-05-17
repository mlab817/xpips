// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadRequest _$UploadRequestFromJson(Map<String, dynamic> json) {
  return _UploadRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadRequest {
  List<int> get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadRequestCopyWith<UploadRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadRequestCopyWith<$Res> {
  factory $UploadRequestCopyWith(
          UploadRequest value, $Res Function(UploadRequest) then) =
      _$UploadRequestCopyWithImpl<$Res, UploadRequest>;
  @useResult
  $Res call({List<int> file});
}

/// @nodoc
class _$UploadRequestCopyWithImpl<$Res, $Val extends UploadRequest>
    implements $UploadRequestCopyWith<$Res> {
  _$UploadRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadRequestCopyWith<$Res>
    implements $UploadRequestCopyWith<$Res> {
  factory _$$_UploadRequestCopyWith(
          _$_UploadRequest value, $Res Function(_$_UploadRequest) then) =
      __$$_UploadRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> file});
}

/// @nodoc
class __$$_UploadRequestCopyWithImpl<$Res>
    extends _$UploadRequestCopyWithImpl<$Res, _$_UploadRequest>
    implements _$$_UploadRequestCopyWith<$Res> {
  __$$_UploadRequestCopyWithImpl(
      _$_UploadRequest _value, $Res Function(_$_UploadRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$_UploadRequest(
      file: null == file
          ? _value._file
          : file // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadRequest implements _UploadRequest {
  _$_UploadRequest({required final List<int> file}) : _file = file;

  factory _$_UploadRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UploadRequestFromJson(json);

  final List<int> _file;
  @override
  List<int> get file {
    if (_file is EqualUnmodifiableListView) return _file;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_file);
  }

  @override
  String toString() {
    return 'UploadRequest(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadRequest &&
            const DeepCollectionEquality().equals(other._file, _file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_file));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadRequestCopyWith<_$_UploadRequest> get copyWith =>
      __$$_UploadRequestCopyWithImpl<_$_UploadRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadRequestToJson(
      this,
    );
  }
}

abstract class _UploadRequest implements UploadRequest {
  factory _UploadRequest({required final List<int> file}) = _$_UploadRequest;

  factory _UploadRequest.fromJson(Map<String, dynamic> json) =
      _$_UploadRequest.fromJson;

  @override
  List<int> get file;
  @override
  @JsonKey(ignore: true)
  _$$_UploadRequestCopyWith<_$_UploadRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
