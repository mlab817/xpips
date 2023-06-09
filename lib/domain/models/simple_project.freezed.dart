// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimpleProject _$SimpleProjectFromJson(Map<String, dynamic> json) {
  return _SimpleProject.fromJson(json);
}

/// @nodoc
mixin _$SimpleProject {
  String get title => throw _privateConstructorUsedError;
  Option? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "regular_program")
  bool get regularProgram => throw _privateConstructorUsedError;
  List<Option> get bases => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "total_cost")
  double get totalCost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleProjectCopyWith<SimpleProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleProjectCopyWith<$Res> {
  factory $SimpleProjectCopyWith(
          SimpleProject value, $Res Function(SimpleProject) then) =
      _$SimpleProjectCopyWithImpl<$Res, SimpleProject>;
  @useResult
  $Res call(
      {String title,
      Option? type,
      @JsonKey(name: "regular_program") bool regularProgram,
      List<Option> bases,
      String description,
      @JsonKey(name: "total_cost") double totalCost});

  $OptionCopyWith<$Res>? get type;
}

/// @nodoc
class _$SimpleProjectCopyWithImpl<$Res, $Val extends SimpleProject>
    implements $SimpleProjectCopyWith<$Res> {
  _$SimpleProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = freezed,
    Object? regularProgram = null,
    Object? bases = null,
    Object? description = null,
    Object? totalCost = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Option?,
      regularProgram: null == regularProgram
          ? _value.regularProgram
          : regularProgram // ignore: cast_nullable_to_non_nullable
              as bool,
      bases: null == bases
          ? _value.bases
          : bases // ignore: cast_nullable_to_non_nullable
              as List<Option>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $OptionCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SimpleProjectCopyWith<$Res>
    implements $SimpleProjectCopyWith<$Res> {
  factory _$$_SimpleProjectCopyWith(
          _$_SimpleProject value, $Res Function(_$_SimpleProject) then) =
      __$$_SimpleProjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      Option? type,
      @JsonKey(name: "regular_program") bool regularProgram,
      List<Option> bases,
      String description,
      @JsonKey(name: "total_cost") double totalCost});

  @override
  $OptionCopyWith<$Res>? get type;
}

/// @nodoc
class __$$_SimpleProjectCopyWithImpl<$Res>
    extends _$SimpleProjectCopyWithImpl<$Res, _$_SimpleProject>
    implements _$$_SimpleProjectCopyWith<$Res> {
  __$$_SimpleProjectCopyWithImpl(
      _$_SimpleProject _value, $Res Function(_$_SimpleProject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = freezed,
    Object? regularProgram = null,
    Object? bases = null,
    Object? description = null,
    Object? totalCost = null,
  }) {
    return _then(_$_SimpleProject(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Option?,
      regularProgram: null == regularProgram
          ? _value.regularProgram
          : regularProgram // ignore: cast_nullable_to_non_nullable
              as bool,
      bases: null == bases
          ? _value._bases
          : bases // ignore: cast_nullable_to_non_nullable
              as List<Option>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimpleProject implements _SimpleProject {
  _$_SimpleProject(
      {required this.title,
      this.type,
      @JsonKey(name: "regular_program") required this.regularProgram,
      required final List<Option> bases,
      required this.description,
      @JsonKey(name: "total_cost") required this.totalCost})
      : _bases = bases;

  factory _$_SimpleProject.fromJson(Map<String, dynamic> json) =>
      _$$_SimpleProjectFromJson(json);

  @override
  final String title;
  @override
  final Option? type;
  @override
  @JsonKey(name: "regular_program")
  final bool regularProgram;
  final List<Option> _bases;
  @override
  List<Option> get bases {
    if (_bases is EqualUnmodifiableListView) return _bases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bases);
  }

  @override
  final String description;
  @override
  @JsonKey(name: "total_cost")
  final double totalCost;

  @override
  String toString() {
    return 'SimpleProject(title: $title, type: $type, regularProgram: $regularProgram, bases: $bases, description: $description, totalCost: $totalCost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleProject &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.regularProgram, regularProgram) ||
                other.regularProgram == regularProgram) &&
            const DeepCollectionEquality().equals(other._bases, _bases) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, type, regularProgram,
      const DeepCollectionEquality().hash(_bases), description, totalCost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimpleProjectCopyWith<_$_SimpleProject> get copyWith =>
      __$$_SimpleProjectCopyWithImpl<_$_SimpleProject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimpleProjectToJson(
      this,
    );
  }
}

abstract class _SimpleProject implements SimpleProject {
  factory _SimpleProject(
          {required final String title,
          final Option? type,
          @JsonKey(name: "regular_program") required final bool regularProgram,
          required final List<Option> bases,
          required final String description,
          @JsonKey(name: "total_cost") required final double totalCost}) =
      _$_SimpleProject;

  factory _SimpleProject.fromJson(Map<String, dynamic> json) =
      _$_SimpleProject.fromJson;

  @override
  String get title;
  @override
  Option? get type;
  @override
  @JsonKey(name: "regular_program")
  bool get regularProgram;
  @override
  List<Option> get bases;
  @override
  String get description;
  @override
  @JsonKey(name: "total_cost")
  double get totalCost;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleProjectCopyWith<_$_SimpleProject> get copyWith =>
      throw _privateConstructorUsedError;
}
