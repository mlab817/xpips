// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  int get id => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_resolved")
  bool get isResolved => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {int id,
      String comment,
      @JsonKey(name: "user_id") int userId,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "is_resolved") bool isResolved,
      User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = null,
    Object? userId = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? isResolved = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String comment,
      @JsonKey(name: "user_id") int userId,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "is_resolved") bool isResolved,
      User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$_Comment>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? comment = null,
    Object? userId = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? isResolved = null,
    Object? user = null,
  }) {
    return _then(_$_Comment(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  _$_Comment(
      {required this.id,
      required this.comment,
      @JsonKey(name: "user_id") required this.userId,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "is_resolved") required this.isResolved,
      required this.user});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  final int id;
  @override
  final String comment;
  @override
  @JsonKey(name: "user_id")
  final int userId;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "is_resolved")
  final bool isResolved;
  @override
  final User user;

  @override
  String toString() {
    return 'Comment(id: $id, comment: $comment, userId: $userId, updatedAt: $updatedAt, createdAt: $createdAt, isResolved: $isResolved, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, comment, userId, updatedAt, createdAt, isResolved, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  factory _Comment(
      {required final int id,
      required final String comment,
      @JsonKey(name: "user_id") required final int userId,
      @JsonKey(name: "updated_at") required final DateTime updatedAt,
      @JsonKey(name: "created_at") required final DateTime createdAt,
      @JsonKey(name: "is_resolved") required final bool isResolved,
      required final User user}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  int get id;
  @override
  String get comment;
  @override
  @JsonKey(name: "user_id")
  int get userId;
  @override
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "is_resolved")
  bool get isResolved;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
