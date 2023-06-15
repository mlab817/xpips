// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fs_investment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FsInvestment _$FsInvestmentFromJson(Map<String, dynamic> json) {
  return _FsInvestment.fromJson(json);
}

/// @nodoc
mixin _$FsInvestment {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "project_id")
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: "funding_source_id")
  int? get fundingSourceId => throw _privateConstructorUsedError;
  @JsonKey(name: "funding_source")
  Option? get fundingSource => throw _privateConstructorUsedError;
  @JsonKey(name: "y2022")
  double? get y2022 => throw _privateConstructorUsedError;
  @JsonKey(name: "y2023")
  double? get y2023 => throw _privateConstructorUsedError;
  @JsonKey(name: "y2024")
  double? get y2024 => throw _privateConstructorUsedError;
  @JsonKey(name: "y2025")
  double? get y2025 => throw _privateConstructorUsedError;
  @JsonKey(name: "y2026")
  double? get y2026 => throw _privateConstructorUsedError;
  @JsonKey(name: "y2027")
  double? get y2027 => throw _privateConstructorUsedError;
  @JsonKey(name: "y2028")
  double? get y2028 => throw _privateConstructorUsedError;
  @JsonKey(name: "y2029")
  double? get y2029 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FsInvestmentCopyWith<FsInvestment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FsInvestmentCopyWith<$Res> {
  factory $FsInvestmentCopyWith(
          FsInvestment value, $Res Function(FsInvestment) then) =
      _$FsInvestmentCopyWithImpl<$Res, FsInvestment>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "project_id") int? projectId,
      @JsonKey(name: "funding_source_id") int? fundingSourceId,
      @JsonKey(name: "funding_source") Option? fundingSource,
      @JsonKey(name: "y2022") double? y2022,
      @JsonKey(name: "y2023") double? y2023,
      @JsonKey(name: "y2024") double? y2024,
      @JsonKey(name: "y2025") double? y2025,
      @JsonKey(name: "y2026") double? y2026,
      @JsonKey(name: "y2027") double? y2027,
      @JsonKey(name: "y2028") double? y2028,
      @JsonKey(name: "y2029") double? y2029});

  $OptionCopyWith<$Res>? get fundingSource;
}

/// @nodoc
class _$FsInvestmentCopyWithImpl<$Res, $Val extends FsInvestment>
    implements $FsInvestmentCopyWith<$Res> {
  _$FsInvestmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = freezed,
    Object? fundingSourceId = freezed,
    Object? fundingSource = freezed,
    Object? y2022 = freezed,
    Object? y2023 = freezed,
    Object? y2024 = freezed,
    Object? y2025 = freezed,
    Object? y2026 = freezed,
    Object? y2027 = freezed,
    Object? y2028 = freezed,
    Object? y2029 = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      fundingSourceId: freezed == fundingSourceId
          ? _value.fundingSourceId
          : fundingSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
      fundingSource: freezed == fundingSource
          ? _value.fundingSource
          : fundingSource // ignore: cast_nullable_to_non_nullable
              as Option?,
      y2022: freezed == y2022
          ? _value.y2022
          : y2022 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2023: freezed == y2023
          ? _value.y2023
          : y2023 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2024: freezed == y2024
          ? _value.y2024
          : y2024 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2025: freezed == y2025
          ? _value.y2025
          : y2025 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2026: freezed == y2026
          ? _value.y2026
          : y2026 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2027: freezed == y2027
          ? _value.y2027
          : y2027 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2028: freezed == y2028
          ? _value.y2028
          : y2028 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2029: freezed == y2029
          ? _value.y2029
          : y2029 // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionCopyWith<$Res>? get fundingSource {
    if (_value.fundingSource == null) {
      return null;
    }

    return $OptionCopyWith<$Res>(_value.fundingSource!, (value) {
      return _then(_value.copyWith(fundingSource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FsInvestmentCopyWith<$Res>
    implements $FsInvestmentCopyWith<$Res> {
  factory _$$_FsInvestmentCopyWith(
          _$_FsInvestment value, $Res Function(_$_FsInvestment) then) =
      __$$_FsInvestmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "project_id") int? projectId,
      @JsonKey(name: "funding_source_id") int? fundingSourceId,
      @JsonKey(name: "funding_source") Option? fundingSource,
      @JsonKey(name: "y2022") double? y2022,
      @JsonKey(name: "y2023") double? y2023,
      @JsonKey(name: "y2024") double? y2024,
      @JsonKey(name: "y2025") double? y2025,
      @JsonKey(name: "y2026") double? y2026,
      @JsonKey(name: "y2027") double? y2027,
      @JsonKey(name: "y2028") double? y2028,
      @JsonKey(name: "y2029") double? y2029});

  @override
  $OptionCopyWith<$Res>? get fundingSource;
}

/// @nodoc
class __$$_FsInvestmentCopyWithImpl<$Res>
    extends _$FsInvestmentCopyWithImpl<$Res, _$_FsInvestment>
    implements _$$_FsInvestmentCopyWith<$Res> {
  __$$_FsInvestmentCopyWithImpl(
      _$_FsInvestment _value, $Res Function(_$_FsInvestment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? projectId = freezed,
    Object? fundingSourceId = freezed,
    Object? fundingSource = freezed,
    Object? y2022 = freezed,
    Object? y2023 = freezed,
    Object? y2024 = freezed,
    Object? y2025 = freezed,
    Object? y2026 = freezed,
    Object? y2027 = freezed,
    Object? y2028 = freezed,
    Object? y2029 = freezed,
  }) {
    return _then(_$_FsInvestment(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      fundingSourceId: freezed == fundingSourceId
          ? _value.fundingSourceId
          : fundingSourceId // ignore: cast_nullable_to_non_nullable
              as int?,
      fundingSource: freezed == fundingSource
          ? _value.fundingSource
          : fundingSource // ignore: cast_nullable_to_non_nullable
              as Option?,
      y2022: freezed == y2022
          ? _value.y2022
          : y2022 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2023: freezed == y2023
          ? _value.y2023
          : y2023 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2024: freezed == y2024
          ? _value.y2024
          : y2024 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2025: freezed == y2025
          ? _value.y2025
          : y2025 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2026: freezed == y2026
          ? _value.y2026
          : y2026 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2027: freezed == y2027
          ? _value.y2027
          : y2027 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2028: freezed == y2028
          ? _value.y2028
          : y2028 // ignore: cast_nullable_to_non_nullable
              as double?,
      y2029: freezed == y2029
          ? _value.y2029
          : y2029 // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FsInvestment implements _FsInvestment {
  _$_FsInvestment(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "project_id") this.projectId,
      @JsonKey(name: "funding_source_id") this.fundingSourceId,
      @JsonKey(name: "funding_source") this.fundingSource,
      @JsonKey(name: "y2022") this.y2022,
      @JsonKey(name: "y2023") this.y2023,
      @JsonKey(name: "y2024") this.y2024,
      @JsonKey(name: "y2025") this.y2025,
      @JsonKey(name: "y2026") this.y2026,
      @JsonKey(name: "y2027") this.y2027,
      @JsonKey(name: "y2028") this.y2028,
      @JsonKey(name: "y2029") this.y2029});

  factory _$_FsInvestment.fromJson(Map<String, dynamic> json) =>
      _$$_FsInvestmentFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "project_id")
  final int? projectId;
  @override
  @JsonKey(name: "funding_source_id")
  final int? fundingSourceId;
  @override
  @JsonKey(name: "funding_source")
  final Option? fundingSource;
  @override
  @JsonKey(name: "y2022")
  final double? y2022;
  @override
  @JsonKey(name: "y2023")
  final double? y2023;
  @override
  @JsonKey(name: "y2024")
  final double? y2024;
  @override
  @JsonKey(name: "y2025")
  final double? y2025;
  @override
  @JsonKey(name: "y2026")
  final double? y2026;
  @override
  @JsonKey(name: "y2027")
  final double? y2027;
  @override
  @JsonKey(name: "y2028")
  final double? y2028;
  @override
  @JsonKey(name: "y2029")
  final double? y2029;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FsInvestment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.fundingSourceId, fundingSourceId) ||
                other.fundingSourceId == fundingSourceId) &&
            (identical(other.fundingSource, fundingSource) ||
                other.fundingSource == fundingSource) &&
            (identical(other.y2022, y2022) || other.y2022 == y2022) &&
            (identical(other.y2023, y2023) || other.y2023 == y2023) &&
            (identical(other.y2024, y2024) || other.y2024 == y2024) &&
            (identical(other.y2025, y2025) || other.y2025 == y2025) &&
            (identical(other.y2026, y2026) || other.y2026 == y2026) &&
            (identical(other.y2027, y2027) || other.y2027 == y2027) &&
            (identical(other.y2028, y2028) || other.y2028 == y2028) &&
            (identical(other.y2029, y2029) || other.y2029 == y2029));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, projectId, fundingSourceId,
      fundingSource, y2022, y2023, y2024, y2025, y2026, y2027, y2028, y2029);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FsInvestmentCopyWith<_$_FsInvestment> get copyWith =>
      __$$_FsInvestmentCopyWithImpl<_$_FsInvestment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FsInvestmentToJson(
      this,
    );
  }
}

abstract class _FsInvestment implements FsInvestment {
  factory _FsInvestment(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "project_id") final int? projectId,
      @JsonKey(name: "funding_source_id") final int? fundingSourceId,
      @JsonKey(name: "funding_source") final Option? fundingSource,
      @JsonKey(name: "y2022") final double? y2022,
      @JsonKey(name: "y2023") final double? y2023,
      @JsonKey(name: "y2024") final double? y2024,
      @JsonKey(name: "y2025") final double? y2025,
      @JsonKey(name: "y2026") final double? y2026,
      @JsonKey(name: "y2027") final double? y2027,
      @JsonKey(name: "y2028") final double? y2028,
      @JsonKey(name: "y2029") final double? y2029}) = _$_FsInvestment;

  factory _FsInvestment.fromJson(Map<String, dynamic> json) =
      _$_FsInvestment.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "project_id")
  int? get projectId;
  @override
  @JsonKey(name: "funding_source_id")
  int? get fundingSourceId;
  @override
  @JsonKey(name: "funding_source")
  Option? get fundingSource;
  @override
  @JsonKey(name: "y2022")
  double? get y2022;
  @override
  @JsonKey(name: "y2023")
  double? get y2023;
  @override
  @JsonKey(name: "y2024")
  double? get y2024;
  @override
  @JsonKey(name: "y2025")
  double? get y2025;
  @override
  @JsonKey(name: "y2026")
  double? get y2026;
  @override
  @JsonKey(name: "y2027")
  double? get y2027;
  @override
  @JsonKey(name: "y2028")
  double? get y2028;
  @override
  @JsonKey(name: "y2029")
  double? get y2029;
  @override
  @JsonKey(ignore: true)
  _$$_FsInvestmentCopyWith<_$_FsInvestment> get copyWith =>
      throw _privateConstructorUsedError;
}
