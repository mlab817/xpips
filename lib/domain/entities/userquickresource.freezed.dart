// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userquickresource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserQuickResource _$UserQuickResourceFromJson(Map<String, dynamic> json) {
  return _UserQuickResource.fromJson(json);
}

/// @nodoc
mixin _$UserQuickResource {
  int get id => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserQuickResourceCopyWith<UserQuickResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserQuickResourceCopyWith<$Res> {
  factory $UserQuickResourceCopyWith(
          UserQuickResource value, $Res Function(UserQuickResource) then) =
      _$UserQuickResourceCopyWithImpl<$Res, UserQuickResource>;
  @useResult
  $Res call(
      {int id, String fullname, @JsonKey(name: "image_url") String? imageUrl});
}

/// @nodoc
class _$UserQuickResourceCopyWithImpl<$Res, $Val extends UserQuickResource>
    implements $UserQuickResourceCopyWith<$Res> {
  _$UserQuickResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullname = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserQuickResourceCopyWith<$Res>
    implements $UserQuickResourceCopyWith<$Res> {
  factory _$$_UserQuickResourceCopyWith(_$_UserQuickResource value,
          $Res Function(_$_UserQuickResource) then) =
      __$$_UserQuickResourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String fullname, @JsonKey(name: "image_url") String? imageUrl});
}

/// @nodoc
class __$$_UserQuickResourceCopyWithImpl<$Res>
    extends _$UserQuickResourceCopyWithImpl<$Res, _$_UserQuickResource>
    implements _$$_UserQuickResourceCopyWith<$Res> {
  __$$_UserQuickResourceCopyWithImpl(
      _$_UserQuickResource _value, $Res Function(_$_UserQuickResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullname = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_UserQuickResource(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserQuickResource implements _UserQuickResource {
  _$_UserQuickResource(
      {required this.id,
      required this.fullname,
      @JsonKey(name: "image_url") this.imageUrl});

  factory _$_UserQuickResource.fromJson(Map<String, dynamic> json) =>
      _$$_UserQuickResourceFromJson(json);

  @override
  final int id;
  @override
  final String fullname;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;

  @override
  String toString() {
    return 'UserQuickResource(id: $id, fullname: $fullname, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserQuickResource &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullname, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserQuickResourceCopyWith<_$_UserQuickResource> get copyWith =>
      __$$_UserQuickResourceCopyWithImpl<_$_UserQuickResource>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserQuickResourceToJson(
      this,
    );
  }
}

abstract class _UserQuickResource implements UserQuickResource {
  factory _UserQuickResource(
          {required final int id,
          required final String fullname,
          @JsonKey(name: "image_url") final String? imageUrl}) =
      _$_UserQuickResource;

  factory _UserQuickResource.fromJson(Map<String, dynamic> json) =
      _$_UserQuickResource.fromJson;

  @override
  int get id;
  @override
  String get fullname;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_UserQuickResourceCopyWith<_$_UserQuickResource> get copyWith =>
      throw _privateConstructorUsedError;
}
