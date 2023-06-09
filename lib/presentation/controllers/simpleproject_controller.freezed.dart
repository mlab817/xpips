// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simpleproject_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SimpleProjectState {
  SimpleProject get project => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimpleProjectStateCopyWith<SimpleProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleProjectStateCopyWith<$Res> {
  factory $SimpleProjectStateCopyWith(
          SimpleProjectState value, $Res Function(SimpleProjectState) then) =
      _$SimpleProjectStateCopyWithImpl<$Res, SimpleProjectState>;
  @useResult
  $Res call({SimpleProject project});

  $SimpleProjectCopyWith<$Res> get project;
}

/// @nodoc
class _$SimpleProjectStateCopyWithImpl<$Res, $Val extends SimpleProjectState>
    implements $SimpleProjectStateCopyWith<$Res> {
  _$SimpleProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as SimpleProject,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SimpleProjectCopyWith<$Res> get project {
    return $SimpleProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SimpleProjectStateCopyWith<$Res>
    implements $SimpleProjectStateCopyWith<$Res> {
  factory _$$_SimpleProjectStateCopyWith(_$_SimpleProjectState value,
          $Res Function(_$_SimpleProjectState) then) =
      __$$_SimpleProjectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SimpleProject project});

  @override
  $SimpleProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$_SimpleProjectStateCopyWithImpl<$Res>
    extends _$SimpleProjectStateCopyWithImpl<$Res, _$_SimpleProjectState>
    implements _$$_SimpleProjectStateCopyWith<$Res> {
  __$$_SimpleProjectStateCopyWithImpl(
      _$_SimpleProjectState _value, $Res Function(_$_SimpleProjectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$_SimpleProjectState(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as SimpleProject,
    ));
  }
}

/// @nodoc

class _$_SimpleProjectState extends _SimpleProjectState {
  _$_SimpleProjectState({required this.project}) : super._();

  @override
  final SimpleProject project;

  @override
  String toString() {
    return 'SimpleProjectState(project: $project)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimpleProjectState &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimpleProjectStateCopyWith<_$_SimpleProjectState> get copyWith =>
      __$$_SimpleProjectStateCopyWithImpl<_$_SimpleProjectState>(
          this, _$identity);
}

abstract class _SimpleProjectState extends SimpleProjectState {
  factory _SimpleProjectState({required final SimpleProject project}) =
      _$_SimpleProjectState;
  _SimpleProjectState._() : super._();

  @override
  SimpleProject get project;
  @override
  @JsonKey(ignore: true)
  _$$_SimpleProjectStateCopyWith<_$_SimpleProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
