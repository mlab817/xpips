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
  @JsonKey(name: "notes")
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: "permissions")
  Permissions get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: "comments_count")
  int get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "readonly")
  bool get readonly => throw _privateConstructorUsedError;
  @JsonKey(name: "outdated")
  bool get outdated => throw _privateConstructorUsedError;
  @JsonKey(name: "updating_period")
  Option? get updatingPeriod => throw _privateConstructorUsedError;

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
      @JsonKey(name: "contact_information") String? contactInformation,
      @JsonKey(name: "notes") String? notes,
      @JsonKey(name: "permissions") Permissions permissions,
      @JsonKey(name: "comments_count") int commentsCount,
      @JsonKey(name: "readonly") bool readonly,
      @JsonKey(name: "outdated") bool outdated,
      @JsonKey(name: "updating_period") Option? updatingPeriod});

  $OfficeCopyWith<$Res>? get office;
  $UserCopyWith<$Res>? get user;
  $PermissionsCopyWith<$Res> get permissions;
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
    Object? notes = freezed,
    Object? permissions = null,
    Object? commentsCount = null,
    Object? readonly = null,
    Object? outdated = null,
    Object? updatingPeriod = freezed,
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      readonly: null == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool,
      outdated: null == outdated
          ? _value.outdated
          : outdated // ignore: cast_nullable_to_non_nullable
              as bool,
      updatingPeriod: freezed == updatingPeriod
          ? _value.updatingPeriod
          : updatingPeriod // ignore: cast_nullable_to_non_nullable
              as Option?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $PermissionsCopyWith<$Res> get permissions {
    return $PermissionsCopyWith<$Res>(_value.permissions, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
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
      @JsonKey(name: "contact_information") String? contactInformation,
      @JsonKey(name: "notes") String? notes,
      @JsonKey(name: "permissions") Permissions permissions,
      @JsonKey(name: "comments_count") int commentsCount,
      @JsonKey(name: "readonly") bool readonly,
      @JsonKey(name: "outdated") bool outdated,
      @JsonKey(name: "updating_period") Option? updatingPeriod});

  @override
  $OfficeCopyWith<$Res>? get office;
  @override
  $UserCopyWith<$Res>? get user;
  @override
  $PermissionsCopyWith<$Res> get permissions;
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
    Object? notes = freezed,
    Object? permissions = null,
    Object? commentsCount = null,
    Object? readonly = null,
    Object? outdated = null,
    Object? updatingPeriod = freezed,
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      readonly: null == readonly
          ? _value.readonly
          : readonly // ignore: cast_nullable_to_non_nullable
              as bool,
      outdated: null == outdated
          ? _value.outdated
          : outdated // ignore: cast_nullable_to_non_nullable
              as bool,
      updatingPeriod: freezed == updatingPeriod
          ? _value.updatingPeriod
          : updatingPeriod // ignore: cast_nullable_to_non_nullable
              as Option?,
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
      @JsonKey(name: "contact_information") this.contactInformation,
      @JsonKey(name: "notes") this.notes,
      @JsonKey(name: "permissions") required this.permissions,
      @JsonKey(name: "comments_count") required this.commentsCount,
      @JsonKey(name: "readonly") required this.readonly,
      @JsonKey(name: "outdated") required this.outdated,
      @JsonKey(name: "updating_period") this.updatingPeriod});

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
  @JsonKey(name: "notes")
  final String? notes;
  @override
  @JsonKey(name: "permissions")
  final Permissions permissions;
  @override
  @JsonKey(name: "comments_count")
  final int commentsCount;
  @override
  @JsonKey(name: "readonly")
  final bool readonly;
  @override
  @JsonKey(name: "outdated")
  final bool outdated;
  @override
  @JsonKey(name: "updating_period")
  final Option? updatingPeriod;

  @override
  String toString() {
    return 'Project(uuid: $uuid, title: $title, totalCost: $totalCost, isLocked: $isLocked, updatedAt: $updatedAt, pipolCode: $pipolCode, description: $description, spatialCoverage: $spatialCoverage, office: $office, user: $user, isRead: $isRead, contactInformation: $contactInformation, notes: $notes, permissions: $permissions, commentsCount: $commentsCount, readonly: $readonly, outdated: $outdated, updatingPeriod: $updatingPeriod)';
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
                other.contactInformation == contactInformation) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.readonly, readonly) ||
                other.readonly == readonly) &&
            (identical(other.outdated, outdated) ||
                other.outdated == outdated) &&
            (identical(other.updatingPeriod, updatingPeriod) ||
                other.updatingPeriod == updatingPeriod));
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
      contactInformation,
      notes,
      permissions,
      commentsCount,
      readonly,
      outdated,
      updatingPeriod);

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
          final String? contactInformation,
      @JsonKey(name: "notes")
          final String? notes,
      @JsonKey(name: "permissions")
          required final Permissions permissions,
      @JsonKey(name: "comments_count")
          required final int commentsCount,
      @JsonKey(name: "readonly")
          required final bool readonly,
      @JsonKey(name: "outdated")
          required final bool outdated,
      @JsonKey(name: "updating_period")
          final Option? updatingPeriod}) = _$_Project;

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
  @JsonKey(name: "notes")
  String? get notes;
  @override
  @JsonKey(name: "permissions")
  Permissions get permissions;
  @override
  @JsonKey(name: "comments_count")
  int get commentsCount;
  @override
  @JsonKey(name: "readonly")
  bool get readonly;
  @override
  @JsonKey(name: "outdated")
  bool get outdated;
  @override
  @JsonKey(name: "updating_period")
  Option? get updatingPeriod;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}

Permissions _$PermissionsFromJson(Map<String, dynamic> json) {
  return _Permissions.fromJson(json);
}

/// @nodoc
mixin _$Permissions {
  bool get view => throw _privateConstructorUsedError;
  bool get update => throw _privateConstructorUsedError;
  bool get delete => throw _privateConstructorUsedError;
  bool get lock => throw _privateConstructorUsedError;
  bool get unlock => throw _privateConstructorUsedError;
  bool get validate => throw _privateConstructorUsedError;
  bool get drop => throw _privateConstructorUsedError;
  @JsonKey(name: "update_pipol")
  bool get updatePipol => throw _privateConstructorUsedError;
  @JsonKey(name: "submit_for_review")
  bool get submitForReview => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionsCopyWith<Permissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsCopyWith<$Res> {
  factory $PermissionsCopyWith(
          Permissions value, $Res Function(Permissions) then) =
      _$PermissionsCopyWithImpl<$Res, Permissions>;
  @useResult
  $Res call(
      {bool view,
      bool update,
      bool delete,
      bool lock,
      bool unlock,
      bool validate,
      bool drop,
      @JsonKey(name: "update_pipol") bool updatePipol,
      @JsonKey(name: "submit_for_review") bool submitForReview});
}

/// @nodoc
class _$PermissionsCopyWithImpl<$Res, $Val extends Permissions>
    implements $PermissionsCopyWith<$Res> {
  _$PermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = null,
    Object? update = null,
    Object? delete = null,
    Object? lock = null,
    Object? unlock = null,
    Object? validate = null,
    Object? drop = null,
    Object? updatePipol = null,
    Object? submitForReview = null,
  }) {
    return _then(_value.copyWith(
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as bool,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as bool,
      delete: null == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
      unlock: null == unlock
          ? _value.unlock
          : unlock // ignore: cast_nullable_to_non_nullable
              as bool,
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as bool,
      drop: null == drop
          ? _value.drop
          : drop // ignore: cast_nullable_to_non_nullable
              as bool,
      updatePipol: null == updatePipol
          ? _value.updatePipol
          : updatePipol // ignore: cast_nullable_to_non_nullable
              as bool,
      submitForReview: null == submitForReview
          ? _value.submitForReview
          : submitForReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PermissionsCopyWith<$Res>
    implements $PermissionsCopyWith<$Res> {
  factory _$$_PermissionsCopyWith(
          _$_Permissions value, $Res Function(_$_Permissions) then) =
      __$$_PermissionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool view,
      bool update,
      bool delete,
      bool lock,
      bool unlock,
      bool validate,
      bool drop,
      @JsonKey(name: "update_pipol") bool updatePipol,
      @JsonKey(name: "submit_for_review") bool submitForReview});
}

/// @nodoc
class __$$_PermissionsCopyWithImpl<$Res>
    extends _$PermissionsCopyWithImpl<$Res, _$_Permissions>
    implements _$$_PermissionsCopyWith<$Res> {
  __$$_PermissionsCopyWithImpl(
      _$_Permissions _value, $Res Function(_$_Permissions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = null,
    Object? update = null,
    Object? delete = null,
    Object? lock = null,
    Object? unlock = null,
    Object? validate = null,
    Object? drop = null,
    Object? updatePipol = null,
    Object? submitForReview = null,
  }) {
    return _then(_$_Permissions(
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as bool,
      update: null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as bool,
      delete: null == delete
          ? _value.delete
          : delete // ignore: cast_nullable_to_non_nullable
              as bool,
      lock: null == lock
          ? _value.lock
          : lock // ignore: cast_nullable_to_non_nullable
              as bool,
      unlock: null == unlock
          ? _value.unlock
          : unlock // ignore: cast_nullable_to_non_nullable
              as bool,
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as bool,
      drop: null == drop
          ? _value.drop
          : drop // ignore: cast_nullable_to_non_nullable
              as bool,
      updatePipol: null == updatePipol
          ? _value.updatePipol
          : updatePipol // ignore: cast_nullable_to_non_nullable
              as bool,
      submitForReview: null == submitForReview
          ? _value.submitForReview
          : submitForReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Permissions implements _Permissions {
  _$_Permissions(
      {required this.view,
      required this.update,
      required this.delete,
      required this.lock,
      required this.unlock,
      required this.validate,
      required this.drop,
      @JsonKey(name: "update_pipol") required this.updatePipol,
      @JsonKey(name: "submit_for_review") required this.submitForReview});

  factory _$_Permissions.fromJson(Map<String, dynamic> json) =>
      _$$_PermissionsFromJson(json);

  @override
  final bool view;
  @override
  final bool update;
  @override
  final bool delete;
  @override
  final bool lock;
  @override
  final bool unlock;
  @override
  final bool validate;
  @override
  final bool drop;
  @override
  @JsonKey(name: "update_pipol")
  final bool updatePipol;
  @override
  @JsonKey(name: "submit_for_review")
  final bool submitForReview;

  @override
  String toString() {
    return 'Permissions(view: $view, update: $update, delete: $delete, lock: $lock, unlock: $unlock, validate: $validate, drop: $drop, updatePipol: $updatePipol, submitForReview: $submitForReview)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Permissions &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.update, update) || other.update == update) &&
            (identical(other.delete, delete) || other.delete == delete) &&
            (identical(other.lock, lock) || other.lock == lock) &&
            (identical(other.unlock, unlock) || other.unlock == unlock) &&
            (identical(other.validate, validate) ||
                other.validate == validate) &&
            (identical(other.drop, drop) || other.drop == drop) &&
            (identical(other.updatePipol, updatePipol) ||
                other.updatePipol == updatePipol) &&
            (identical(other.submitForReview, submitForReview) ||
                other.submitForReview == submitForReview));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, view, update, delete, lock,
      unlock, validate, drop, updatePipol, submitForReview);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionsCopyWith<_$_Permissions> get copyWith =>
      __$$_PermissionsCopyWithImpl<_$_Permissions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PermissionsToJson(
      this,
    );
  }
}

abstract class _Permissions implements Permissions {
  factory _Permissions(
      {required final bool view,
      required final bool update,
      required final bool delete,
      required final bool lock,
      required final bool unlock,
      required final bool validate,
      required final bool drop,
      @JsonKey(name: "update_pipol")
          required final bool updatePipol,
      @JsonKey(name: "submit_for_review")
          required final bool submitForReview}) = _$_Permissions;

  factory _Permissions.fromJson(Map<String, dynamic> json) =
      _$_Permissions.fromJson;

  @override
  bool get view;
  @override
  bool get update;
  @override
  bool get delete;
  @override
  bool get lock;
  @override
  bool get unlock;
  @override
  bool get validate;
  @override
  bool get drop;
  @override
  @JsonKey(name: "update_pipol")
  bool get updatePipol;
  @override
  @JsonKey(name: "submit_for_review")
  bool get submitForReview;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionsCopyWith<_$_Permissions> get copyWith =>
      throw _privateConstructorUsedError;
}
