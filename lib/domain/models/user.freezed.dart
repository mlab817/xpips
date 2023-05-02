// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "uuid")
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "fullname")
  String? get fullname => throw _privateConstructorUsedError;
  @JsonKey(name: "position")
  String? get position => throw _privateConstructorUsedError;
  @JsonKey(name: "contact_number")
  String? get contactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "office")
  Office? get office => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "uuid") String? uuid,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fullname") String? fullname,
      @JsonKey(name: "position") String? position,
      @JsonKey(name: "contact_number") String? contactNumber,
      @JsonKey(name: "image_url") String? imageUrl,
      String? name,
      @JsonKey(name: "office") Office? office});

  $OfficeCopyWith<$Res>? get office;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = freezed,
    Object? username = null,
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullname = freezed,
    Object? position = freezed,
    Object? contactNumber = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? office = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as Office?,
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
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "uuid") String? uuid,
      @JsonKey(name: "username") String username,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fullname") String? fullname,
      @JsonKey(name: "position") String? position,
      @JsonKey(name: "contact_number") String? contactNumber,
      @JsonKey(name: "image_url") String? imageUrl,
      String? name,
      @JsonKey(name: "office") Office? office});

  @override
  $OfficeCopyWith<$Res>? get office;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = freezed,
    Object? username = null,
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullname = freezed,
    Object? position = freezed,
    Object? contactNumber = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? office = freezed,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as Office?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "uuid") this.uuid,
      @JsonKey(name: "username") required this.username,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "fullname") this.fullname,
      @JsonKey(name: "position") this.position,
      @JsonKey(name: "contact_number") this.contactNumber,
      @JsonKey(name: "image_url") this.imageUrl,
      this.name,
      @JsonKey(name: "office") this.office});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "uuid")
  final String? uuid;
  @override
  @JsonKey(name: "username")
  final String username;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "fullname")
  final String? fullname;
  @override
  @JsonKey(name: "position")
  final String? position;
  @override
  @JsonKey(name: "contact_number")
  final String? contactNumber;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  final String? name;
  @override
  @JsonKey(name: "office")
  final Office? office;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.office, office) || other.office == office));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      username,
      email,
      firstName,
      lastName,
      fullname,
      position,
      contactNumber,
      imageUrl,
      name,
      office);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "uuid") final String? uuid,
      @JsonKey(name: "username") required final String username,
      @JsonKey(name: "email") required final String email,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "fullname") final String? fullname,
      @JsonKey(name: "position") final String? position,
      @JsonKey(name: "contact_number") final String? contactNumber,
      @JsonKey(name: "image_url") final String? imageUrl,
      final String? name,
      @JsonKey(name: "office") final Office? office}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "uuid")
  String? get uuid;
  @override
  @JsonKey(name: "username")
  String get username;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "fullname")
  String? get fullname;
  @override
  @JsonKey(name: "position")
  String? get position;
  @override
  @JsonKey(name: "contact_number")
  String? get contactNumber;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  String? get name;
  @override
  @JsonKey(name: "office")
  Office? get office;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
