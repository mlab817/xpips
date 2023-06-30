// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evaluationreport_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EvaluationReportResponse _$EvaluationReportResponseFromJson(
    Map<String, dynamic> json) {
  return _EvaluationReportResponse.fromJson(json);
}

/// @nodoc
mixin _$EvaluationReportResponse {
  EvaluationReport get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvaluationReportResponseCopyWith<EvaluationReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvaluationReportResponseCopyWith<$Res> {
  factory $EvaluationReportResponseCopyWith(EvaluationReportResponse value,
          $Res Function(EvaluationReportResponse) then) =
      _$EvaluationReportResponseCopyWithImpl<$Res, EvaluationReportResponse>;
  @useResult
  $Res call({EvaluationReport data});

  $EvaluationReportCopyWith<$Res> get data;
}

/// @nodoc
class _$EvaluationReportResponseCopyWithImpl<$Res,
        $Val extends EvaluationReportResponse>
    implements $EvaluationReportResponseCopyWith<$Res> {
  _$EvaluationReportResponseCopyWithImpl(this._value, this._then);

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
              as EvaluationReport,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EvaluationReportCopyWith<$Res> get data {
    return $EvaluationReportCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EvaluationReportResponseCopyWith<$Res>
    implements $EvaluationReportResponseCopyWith<$Res> {
  factory _$$_EvaluationReportResponseCopyWith(
          _$_EvaluationReportResponse value,
          $Res Function(_$_EvaluationReportResponse) then) =
      __$$_EvaluationReportResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EvaluationReport data});

  @override
  $EvaluationReportCopyWith<$Res> get data;
}

/// @nodoc
class __$$_EvaluationReportResponseCopyWithImpl<$Res>
    extends _$EvaluationReportResponseCopyWithImpl<$Res,
        _$_EvaluationReportResponse>
    implements _$$_EvaluationReportResponseCopyWith<$Res> {
  __$$_EvaluationReportResponseCopyWithImpl(_$_EvaluationReportResponse _value,
      $Res Function(_$_EvaluationReportResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_EvaluationReportResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EvaluationReport,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EvaluationReportResponse implements _EvaluationReportResponse {
  _$_EvaluationReportResponse({required this.data});

  factory _$_EvaluationReportResponse.fromJson(Map<String, dynamic> json) =>
      _$$_EvaluationReportResponseFromJson(json);

  @override
  final EvaluationReport data;

  @override
  String toString() {
    return 'EvaluationReportResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EvaluationReportResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EvaluationReportResponseCopyWith<_$_EvaluationReportResponse>
      get copyWith => __$$_EvaluationReportResponseCopyWithImpl<
          _$_EvaluationReportResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvaluationReportResponseToJson(
      this,
    );
  }
}

abstract class _EvaluationReportResponse implements EvaluationReportResponse {
  factory _EvaluationReportResponse({required final EvaluationReport data}) =
      _$_EvaluationReportResponse;

  factory _EvaluationReportResponse.fromJson(Map<String, dynamic> json) =
      _$_EvaluationReportResponse.fromJson;

  @override
  EvaluationReport get data;
  @override
  @JsonKey(ignore: true)
  _$$_EvaluationReportResponseCopyWith<_$_EvaluationReportResponse>
      get copyWith => throw _privateConstructorUsedError;
}
