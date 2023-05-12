// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  @JsonKey(name: "uuid")
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "total_cost")
  double? get totalCost => throw _privateConstructorUsedError;
  @JsonKey(name: "is_locked")
  bool get isLocked => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "pipol_code")
  String? get pipolCode => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "spatial_coverage")
  Option? get spatialCoverage => throw _privateConstructorUsedError;
  @JsonKey(name: "office")
  Office? get office => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "is_read")
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: "contact_information")
  String? get contactInformation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {@JsonKey(name: "uuid") String uuid,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "total_cost") double? totalCost,
      @JsonKey(name: "is_locked") bool isLocked,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "pipol_code") String? pipolCode,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "spatial_coverage") Option? spatialCoverage,
      @JsonKey(name: "office") Office? office,
      @JsonKey(name: "user") User? user,
      @JsonKey(name: "is_read") bool isRead,
      @JsonKey(name: "contact_information") String? contactInformation});

  $OptionCopyWith<$Res>? get spatialCoverage;
  $OfficeCopyWith<$Res>? get office;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? totalCost = freezed,
    Object? isLocked = null,
    Object? updatedAt = null,
    Object? pipolCode = freezed,
    Object? description = freezed,
    Object? spatialCoverage = freezed,
    Object? office = freezed,
    Object? user = freezed,
    Object? isRead = null,
    Object? contactInformation = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      pipolCode: freezed == pipolCode
          ? _value.pipolCode
          : pipolCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      spatialCoverage: freezed == spatialCoverage
          ? _value.spatialCoverage
          : spatialCoverage // ignore: cast_nullable_to_non_nullable
              as Option?,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as Office?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      contactInformation: freezed == contactInformation
          ? _value.contactInformation
          : contactInformation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionCopyWith<$Res>? get spatialCoverage {
    if (_value.spatialCoverage == null) {
      return null;
    }

    return $OptionCopyWith<$Res>(_value.spatialCoverage!, (value) {
      return _then(_value.copyWith(spatialCoverage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeCopyWith<$Res>? get office {
    if (_value.office == null) {
      return null;
    }

    return $OfficeCopyWith<$Res>(_value.office!, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "uuid") String uuid,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "total_cost") double? totalCost,
      @JsonKey(name: "is_locked") bool isLocked,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "pipol_code") String? pipolCode,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "spatial_coverage") Option? spatialCoverage,
      @JsonKey(name: "office") Office? office,
      @JsonKey(name: "user") User? user,
      @JsonKey(name: "is_read") bool isRead,
      @JsonKey(name: "contact_information") String? contactInformation});

  @override
  $OptionCopyWith<$Res>? get spatialCoverage;
  @override
  $OfficeCopyWith<$Res>? get office;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$_Project>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? totalCost = freezed,
    Object? isLocked = null,
    Object? updatedAt = null,
    Object? pipolCode = freezed,
    Object? description = freezed,
    Object? spatialCoverage = freezed,
    Object? office = freezed,
    Object? user = freezed,
    Object? isRead = null,
    Object? contactInformation = freezed,
  }) {
    return _then(_$_Project(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      pipolCode: freezed == pipolCode
          ? _value.pipolCode
          : pipolCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      spatialCoverage: freezed == spatialCoverage
          ? _value.spatialCoverage
          : spatialCoverage // ignore: cast_nullable_to_non_nullable
              as Option?,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as Office?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      contactInformation: freezed == contactInformation
          ? _value.contactInformation
          : contactInformation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project implements _Project {
  _$_Project(
      {@JsonKey(name: "uuid") required this.uuid,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "total_cost") required this.totalCost,
      @JsonKey(name: "is_locked") required this.isLocked,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "pipol_code") required this.pipolCode,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "spatial_coverage") required this.spatialCoverage,
      @JsonKey(name: "office") required this.office,
      @JsonKey(name: "user") required this.user,
      @JsonKey(name: "is_read") required this.isRead,
      @JsonKey(name: "contact_information") this.contactInformation});

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  @JsonKey(name: "uuid")
  final String uuid;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "total_cost")
  final double? totalCost;
  @override
  @JsonKey(name: "is_locked")
  final bool isLocked;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "pipol_code")
  final String? pipolCode;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "spatial_coverage")
  final Option? spatialCoverage;
  @override
  @JsonKey(name: "office")
  final Office? office;
  @override
  @JsonKey(name: "user")
  final User? user;
  @override
  @JsonKey(name: "is_read")
  final bool isRead;
  @override
  @JsonKey(name: "contact_information")
  final String? contactInformation;

  @override
  String toString() {
    return 'Project(uuid: $uuid, title: $title, totalCost: $totalCost, isLocked: $isLocked, updatedAt: $updatedAt, pipolCode: $pipolCode, description: $description, spatialCoverage: $spatialCoverage, office: $office, user: $user, isRead: $isRead, contactInformation: $contactInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Project &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.pipolCode, pipolCode) ||
                other.pipolCode == pipolCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.spatialCoverage, spatialCoverage) ||
                other.spatialCoverage == spatialCoverage) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.contactInformation, contactInformation) ||
                other.contactInformation == contactInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      totalCost,
      isLocked,
      updatedAt,
      pipolCode,
      description,
      spatialCoverage,
      office,
      user,
      isRead,
      contactInformation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  factory _Project(
      {@JsonKey(name: "uuid")
          required final String uuid,
      @JsonKey(name: "title")
          required final String title,
      @JsonKey(name: "total_cost")
          required final double? totalCost,
      @JsonKey(name: "is_locked")
          required final bool isLocked,
      @JsonKey(name: "updated_at")
          required final String updatedAt,
      @JsonKey(name: "pipol_code")
          required final String? pipolCode,
      @JsonKey(name: "description")
          required final String? description,
      @JsonKey(name: "spatial_coverage")
          required final Option? spatialCoverage,
      @JsonKey(name: "office")
          required final Office? office,
      @JsonKey(name: "user")
          required final User? user,
      @JsonKey(name: "is_read")
          required final bool isRead,
      @JsonKey(name: "contact_information")
          final String? contactInformation}) = _$_Project;

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  @JsonKey(name: "uuid")
  String get uuid;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "total_cost")
  double? get totalCost;
  @override
  @JsonKey(name: "is_locked")
  bool get isLocked;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "pipol_code")
  String? get pipolCode;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "spatial_coverage")
  Option? get spatialCoverage;
  @override
  @JsonKey(name: "office")
  Office? get office;
  @override
  @JsonKey(name: "user")
  User? get user;
  @override
  @JsonKey(name: "is_read")
  bool get isRead;
  @override
  @JsonKey(name: "contact_information")
  String? get contactInformation;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
