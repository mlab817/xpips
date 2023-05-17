// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectsRequest _$ProjectsRequestFromJson(Map<String, dynamic> json) {
  return _ProjectsRequest.fromJson(json);
}

/// @nodoc
mixin _$ProjectsRequest {
  @JsonKey(name: "per_page")
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: "q", includeIfNull: false)
  String? get q => throw _privateConstructorUsedError;
  @JsonKey(name: "types[]", includeIfNull: false)
  List<int>? get types => throw _privateConstructorUsedError;
  @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
  List<int>? get spatialCoverages => throw _privateConstructorUsedError;
  @JsonKey(name: "pip", includeIfNull: false)
  bool? get pip => throw _privateConstructorUsedError;
  @JsonKey(name: "cip", includeIfNull: false)
  bool? get cip => throw _privateConstructorUsedError;
  @JsonKey(name: "trip", includeIfNull: false)
  bool? get trip => throw _privateConstructorUsedError;
  @JsonKey(name: "rdip", includeIfNull: false)
  bool? get rdip => throw _privateConstructorUsedError;
  @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
  List<int>? get pdpChapters => throw _privateConstructorUsedError;
  @JsonKey(name: "project_statuses[]", includeIfNull: false)
  List<int>? get projectStatuses => throw _privateConstructorUsedError;
  @JsonKey(name: "categories[]", includeIfNull: false)
  List<int>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
  List<int>? get pipolStatuses => throw _privateConstructorUsedError;
  @JsonKey(name: "pips_statuses[]", includeIfNull: false)
  List<int>? get pipsStatuses => throw _privateConstructorUsedError;
  @JsonKey(name: "offices[]", includeIfNull: false)
  List<int>? get offices => throw _privateConstructorUsedError;
  @JsonKey(name: "funding_sources[]", includeIfNull: false)
  List<int>? get fundingSources => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectsRequestCopyWith<ProjectsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsRequestCopyWith<$Res> {
  factory $ProjectsRequestCopyWith(
          ProjectsRequest value, $Res Function(ProjectsRequest) then) =
      _$ProjectsRequestCopyWithImpl<$Res, ProjectsRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "per_page")
          int perPage,
      @JsonKey(name: "page")
          int page,
      @JsonKey(name: "q", includeIfNull: false)
          String? q,
      @JsonKey(name: "types[]", includeIfNull: false)
          List<int>? types,
      @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
          List<int>? spatialCoverages,
      @JsonKey(name: "pip", includeIfNull: false)
          bool? pip,
      @JsonKey(name: "cip", includeIfNull: false)
          bool? cip,
      @JsonKey(name: "trip", includeIfNull: false)
          bool? trip,
      @JsonKey(name: "rdip", includeIfNull: false)
          bool? rdip,
      @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
          List<int>? pdpChapters,
      @JsonKey(name: "project_statuses[]", includeIfNull: false)
          List<int>? projectStatuses,
      @JsonKey(name: "categories[]", includeIfNull: false)
          List<int>? categories,
      @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
          List<int>? pipolStatuses,
      @JsonKey(name: "pips_statuses[]", includeIfNull: false)
          List<int>? pipsStatuses,
      @JsonKey(name: "offices[]", includeIfNull: false)
          List<int>? offices,
      @JsonKey(name: "funding_sources[]", includeIfNull: false)
          List<int>? fundingSources});
}

/// @nodoc
class _$ProjectsRequestCopyWithImpl<$Res, $Val extends ProjectsRequest>
    implements $ProjectsRequestCopyWith<$Res> {
  _$ProjectsRequestCopyWithImpl(this._value, this._then);

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
    Object? types = freezed,
    Object? spatialCoverages = freezed,
    Object? pip = freezed,
    Object? cip = freezed,
    Object? trip = freezed,
    Object? rdip = freezed,
    Object? pdpChapters = freezed,
    Object? projectStatuses = freezed,
    Object? categories = freezed,
    Object? pipolStatuses = freezed,
    Object? pipsStatuses = freezed,
    Object? offices = freezed,
    Object? fundingSources = freezed,
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
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      spatialCoverages: freezed == spatialCoverages
          ? _value.spatialCoverages
          : spatialCoverages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pip: freezed == pip
          ? _value.pip
          : pip // ignore: cast_nullable_to_non_nullable
              as bool?,
      cip: freezed == cip
          ? _value.cip
          : cip // ignore: cast_nullable_to_non_nullable
              as bool?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as bool?,
      rdip: freezed == rdip
          ? _value.rdip
          : rdip // ignore: cast_nullable_to_non_nullable
              as bool?,
      pdpChapters: freezed == pdpChapters
          ? _value.pdpChapters
          : pdpChapters // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      projectStatuses: freezed == projectStatuses
          ? _value.projectStatuses
          : projectStatuses // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pipolStatuses: freezed == pipolStatuses
          ? _value.pipolStatuses
          : pipolStatuses // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pipsStatuses: freezed == pipsStatuses
          ? _value.pipsStatuses
          : pipsStatuses // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      offices: freezed == offices
          ? _value.offices
          : offices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      fundingSources: freezed == fundingSources
          ? _value.fundingSources
          : fundingSources // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectsRequestCopyWith<$Res>
    implements $ProjectsRequestCopyWith<$Res> {
  factory _$$_ProjectsRequestCopyWith(
          _$_ProjectsRequest value, $Res Function(_$_ProjectsRequest) then) =
      __$$_ProjectsRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "per_page")
          int perPage,
      @JsonKey(name: "page")
          int page,
      @JsonKey(name: "q", includeIfNull: false)
          String? q,
      @JsonKey(name: "types[]", includeIfNull: false)
          List<int>? types,
      @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
          List<int>? spatialCoverages,
      @JsonKey(name: "pip", includeIfNull: false)
          bool? pip,
      @JsonKey(name: "cip", includeIfNull: false)
          bool? cip,
      @JsonKey(name: "trip", includeIfNull: false)
          bool? trip,
      @JsonKey(name: "rdip", includeIfNull: false)
          bool? rdip,
      @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
          List<int>? pdpChapters,
      @JsonKey(name: "project_statuses[]", includeIfNull: false)
          List<int>? projectStatuses,
      @JsonKey(name: "categories[]", includeIfNull: false)
          List<int>? categories,
      @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
          List<int>? pipolStatuses,
      @JsonKey(name: "pips_statuses[]", includeIfNull: false)
          List<int>? pipsStatuses,
      @JsonKey(name: "offices[]", includeIfNull: false)
          List<int>? offices,
      @JsonKey(name: "funding_sources[]", includeIfNull: false)
          List<int>? fundingSources});
}

/// @nodoc
class __$$_ProjectsRequestCopyWithImpl<$Res>
    extends _$ProjectsRequestCopyWithImpl<$Res, _$_ProjectsRequest>
    implements _$$_ProjectsRequestCopyWith<$Res> {
  __$$_ProjectsRequestCopyWithImpl(
      _$_ProjectsRequest _value, $Res Function(_$_ProjectsRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = null,
    Object? page = null,
    Object? q = freezed,
    Object? types = freezed,
    Object? spatialCoverages = freezed,
    Object? pip = freezed,
    Object? cip = freezed,
    Object? trip = freezed,
    Object? rdip = freezed,
    Object? pdpChapters = freezed,
    Object? projectStatuses = freezed,
    Object? categories = freezed,
    Object? pipolStatuses = freezed,
    Object? pipsStatuses = freezed,
    Object? offices = freezed,
    Object? fundingSources = freezed,
  }) {
    return _then(_$_ProjectsRequest(
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
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      spatialCoverages: freezed == spatialCoverages
          ? _value._spatialCoverages
          : spatialCoverages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pip: freezed == pip
          ? _value.pip
          : pip // ignore: cast_nullable_to_non_nullable
              as bool?,
      cip: freezed == cip
          ? _value.cip
          : cip // ignore: cast_nullable_to_non_nullable
              as bool?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as bool?,
      rdip: freezed == rdip
          ? _value.rdip
          : rdip // ignore: cast_nullable_to_non_nullable
              as bool?,
      pdpChapters: freezed == pdpChapters
          ? _value._pdpChapters
          : pdpChapters // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      projectStatuses: freezed == projectStatuses
          ? _value._projectStatuses
          : projectStatuses // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pipolStatuses: freezed == pipolStatuses
          ? _value._pipolStatuses
          : pipolStatuses // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      pipsStatuses: freezed == pipsStatuses
          ? _value._pipsStatuses
          : pipsStatuses // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      offices: freezed == offices
          ? _value._offices
          : offices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      fundingSources: freezed == fundingSources
          ? _value._fundingSources
          : fundingSources // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectsRequest implements _ProjectsRequest {
  _$_ProjectsRequest(
      {@JsonKey(name: "per_page")
          required this.perPage,
      @JsonKey(name: "page")
          required this.page,
      @JsonKey(name: "q", includeIfNull: false)
          this.q,
      @JsonKey(name: "types[]", includeIfNull: false)
          final List<int>? types,
      @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
          final List<int>? spatialCoverages,
      @JsonKey(name: "pip", includeIfNull: false)
          this.pip,
      @JsonKey(name: "cip", includeIfNull: false)
          this.cip,
      @JsonKey(name: "trip", includeIfNull: false)
          this.trip,
      @JsonKey(name: "rdip", includeIfNull: false)
          this.rdip,
      @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
          final List<int>? pdpChapters,
      @JsonKey(name: "project_statuses[]", includeIfNull: false)
          final List<int>? projectStatuses,
      @JsonKey(name: "categories[]", includeIfNull: false)
          final List<int>? categories,
      @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
          final List<int>? pipolStatuses,
      @JsonKey(name: "pips_statuses[]", includeIfNull: false)
          final List<int>? pipsStatuses,
      @JsonKey(name: "offices[]", includeIfNull: false)
          final List<int>? offices,
      @JsonKey(name: "funding_sources[]", includeIfNull: false)
          final List<int>? fundingSources})
      : _types = types,
        _spatialCoverages = spatialCoverages,
        _pdpChapters = pdpChapters,
        _projectStatuses = projectStatuses,
        _categories = categories,
        _pipolStatuses = pipolStatuses,
        _pipsStatuses = pipsStatuses,
        _offices = offices,
        _fundingSources = fundingSources;

  factory _$_ProjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectsRequestFromJson(json);

  @override
  @JsonKey(name: "per_page")
  final int perPage;
  @override
  @JsonKey(name: "page")
  final int page;
  @override
  @JsonKey(name: "q", includeIfNull: false)
  final String? q;
  final List<int>? _types;
  @override
  @JsonKey(name: "types[]", includeIfNull: false)
  List<int>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _spatialCoverages;
  @override
  @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
  List<int>? get spatialCoverages {
    final value = _spatialCoverages;
    if (value == null) return null;
    if (_spatialCoverages is EqualUnmodifiableListView)
      return _spatialCoverages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "pip", includeIfNull: false)
  final bool? pip;
  @override
  @JsonKey(name: "cip", includeIfNull: false)
  final bool? cip;
  @override
  @JsonKey(name: "trip", includeIfNull: false)
  final bool? trip;
  @override
  @JsonKey(name: "rdip", includeIfNull: false)
  final bool? rdip;
  final List<int>? _pdpChapters;
  @override
  @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
  List<int>? get pdpChapters {
    final value = _pdpChapters;
    if (value == null) return null;
    if (_pdpChapters is EqualUnmodifiableListView) return _pdpChapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _projectStatuses;
  @override
  @JsonKey(name: "project_statuses[]", includeIfNull: false)
  List<int>? get projectStatuses {
    final value = _projectStatuses;
    if (value == null) return null;
    if (_projectStatuses is EqualUnmodifiableListView) return _projectStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _categories;
  @override
  @JsonKey(name: "categories[]", includeIfNull: false)
  List<int>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _pipolStatuses;
  @override
  @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
  List<int>? get pipolStatuses {
    final value = _pipolStatuses;
    if (value == null) return null;
    if (_pipolStatuses is EqualUnmodifiableListView) return _pipolStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _pipsStatuses;
  @override
  @JsonKey(name: "pips_statuses[]", includeIfNull: false)
  List<int>? get pipsStatuses {
    final value = _pipsStatuses;
    if (value == null) return null;
    if (_pipsStatuses is EqualUnmodifiableListView) return _pipsStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _offices;
  @override
  @JsonKey(name: "offices[]", includeIfNull: false)
  List<int>? get offices {
    final value = _offices;
    if (value == null) return null;
    if (_offices is EqualUnmodifiableListView) return _offices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _fundingSources;
  @override
  @JsonKey(name: "funding_sources[]", includeIfNull: false)
  List<int>? get fundingSources {
    final value = _fundingSources;
    if (value == null) return null;
    if (_fundingSources is EqualUnmodifiableListView) return _fundingSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProjectsRequest(perPage: $perPage, page: $page, q: $q, types: $types, spatialCoverages: $spatialCoverages, pip: $pip, cip: $cip, trip: $trip, rdip: $rdip, pdpChapters: $pdpChapters, projectStatuses: $projectStatuses, categories: $categories, pipolStatuses: $pipolStatuses, pipsStatuses: $pipsStatuses, offices: $offices, fundingSources: $fundingSources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectsRequest &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.q, q) || other.q == q) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality()
                .equals(other._spatialCoverages, _spatialCoverages) &&
            (identical(other.pip, pip) || other.pip == pip) &&
            (identical(other.cip, cip) || other.cip == cip) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.rdip, rdip) || other.rdip == rdip) &&
            const DeepCollectionEquality()
                .equals(other._pdpChapters, _pdpChapters) &&
            const DeepCollectionEquality()
                .equals(other._projectStatuses, _projectStatuses) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._pipolStatuses, _pipolStatuses) &&
            const DeepCollectionEquality()
                .equals(other._pipsStatuses, _pipsStatuses) &&
            const DeepCollectionEquality().equals(other._offices, _offices) &&
            const DeepCollectionEquality()
                .equals(other._fundingSources, _fundingSources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      perPage,
      page,
      q,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_spatialCoverages),
      pip,
      cip,
      trip,
      rdip,
      const DeepCollectionEquality().hash(_pdpChapters),
      const DeepCollectionEquality().hash(_projectStatuses),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_pipolStatuses),
      const DeepCollectionEquality().hash(_pipsStatuses),
      const DeepCollectionEquality().hash(_offices),
      const DeepCollectionEquality().hash(_fundingSources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectsRequestCopyWith<_$_ProjectsRequest> get copyWith =>
      __$$_ProjectsRequestCopyWithImpl<_$_ProjectsRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectsRequestToJson(
      this,
    );
  }
}

abstract class _ProjectsRequest implements ProjectsRequest {
  factory _ProjectsRequest(
      {@JsonKey(name: "per_page")
          required final int perPage,
      @JsonKey(name: "page")
          required final int page,
      @JsonKey(name: "q", includeIfNull: false)
          final String? q,
      @JsonKey(name: "types[]", includeIfNull: false)
          final List<int>? types,
      @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
          final List<int>? spatialCoverages,
      @JsonKey(name: "pip", includeIfNull: false)
          final bool? pip,
      @JsonKey(name: "cip", includeIfNull: false)
          final bool? cip,
      @JsonKey(name: "trip", includeIfNull: false)
          final bool? trip,
      @JsonKey(name: "rdip", includeIfNull: false)
          final bool? rdip,
      @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
          final List<int>? pdpChapters,
      @JsonKey(name: "project_statuses[]", includeIfNull: false)
          final List<int>? projectStatuses,
      @JsonKey(name: "categories[]", includeIfNull: false)
          final List<int>? categories,
      @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
          final List<int>? pipolStatuses,
      @JsonKey(name: "pips_statuses[]", includeIfNull: false)
          final List<int>? pipsStatuses,
      @JsonKey(name: "offices[]", includeIfNull: false)
          final List<int>? offices,
      @JsonKey(name: "funding_sources[]", includeIfNull: false)
          final List<int>? fundingSources}) = _$_ProjectsRequest;

  factory _ProjectsRequest.fromJson(Map<String, dynamic> json) =
      _$_ProjectsRequest.fromJson;

  @override
  @JsonKey(name: "per_page")
  int get perPage;
  @override
  @JsonKey(name: "page")
  int get page;
  @override
  @JsonKey(name: "q", includeIfNull: false)
  String? get q;
  @override
  @JsonKey(name: "types[]", includeIfNull: false)
  List<int>? get types;
  @override
  @JsonKey(name: "spatial_coverages[]", includeIfNull: false)
  List<int>? get spatialCoverages;
  @override
  @JsonKey(name: "pip", includeIfNull: false)
  bool? get pip;
  @override
  @JsonKey(name: "cip", includeIfNull: false)
  bool? get cip;
  @override
  @JsonKey(name: "trip", includeIfNull: false)
  bool? get trip;
  @override
  @JsonKey(name: "rdip", includeIfNull: false)
  bool? get rdip;
  @override
  @JsonKey(name: "pdp_chapters[]", includeIfNull: false)
  List<int>? get pdpChapters;
  @override
  @JsonKey(name: "project_statuses[]", includeIfNull: false)
  List<int>? get projectStatuses;
  @override
  @JsonKey(name: "categories[]", includeIfNull: false)
  List<int>? get categories;
  @override
  @JsonKey(name: "pipol_statuses[]", includeIfNull: false)
  List<int>? get pipolStatuses;
  @override
  @JsonKey(name: "pips_statuses[]", includeIfNull: false)
  List<int>? get pipsStatuses;
  @override
  @JsonKey(name: "offices[]", includeIfNull: false)
  List<int>? get offices;
  @override
  @JsonKey(name: "funding_sources[]", includeIfNull: false)
  List<int>? get fundingSources;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectsRequestCopyWith<_$_ProjectsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
