// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatroom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  @JsonKey(name: "uuid")
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "last_comment")
  Comment? get lastComment => throw _privateConstructorUsedError;
  @JsonKey(name: "notes")
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call(
      {@JsonKey(name: "uuid") String uuid,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "last_comment") Comment? lastComment,
      @JsonKey(name: "notes") String? notes});

  $CommentCopyWith<$Res>? get lastComment;
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? description = null,
    Object? lastComment = freezed,
    Object? notes = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lastComment: freezed == lastComment
          ? _value.lastComment
          : lastComment // ignore: cast_nullable_to_non_nullable
              as Comment?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res>? get lastComment {
    if (_value.lastComment == null) {
      return null;
    }

    return $CommentCopyWith<$Res>(_value.lastComment!, (value) {
      return _then(_value.copyWith(lastComment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatRoomCopyWith<$Res> implements $ChatRoomCopyWith<$Res> {
  factory _$$_ChatRoomCopyWith(
          _$_ChatRoom value, $Res Function(_$_ChatRoom) then) =
      __$$_ChatRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "uuid") String uuid,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "last_comment") Comment? lastComment,
      @JsonKey(name: "notes") String? notes});

  @override
  $CommentCopyWith<$Res>? get lastComment;
}

/// @nodoc
class __$$_ChatRoomCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$_ChatRoom>
    implements _$$_ChatRoomCopyWith<$Res> {
  __$$_ChatRoomCopyWithImpl(
      _$_ChatRoom _value, $Res Function(_$_ChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? description = null,
    Object? lastComment = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$_ChatRoom(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lastComment: freezed == lastComment
          ? _value.lastComment
          : lastComment // ignore: cast_nullable_to_non_nullable
              as Comment?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoom implements _ChatRoom {
  _$_ChatRoom(
      {@JsonKey(name: "uuid") required this.uuid,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "last_comment") this.lastComment,
      @JsonKey(name: "notes") this.notes});

  factory _$_ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomFromJson(json);

  @override
  @JsonKey(name: "uuid")
  final String uuid;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "last_comment")
  final Comment? lastComment;
  @override
  @JsonKey(name: "notes")
  final String? notes;

  @override
  String toString() {
    return 'ChatRoom(uuid: $uuid, title: $title, description: $description, lastComment: $lastComment, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoom &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastComment, lastComment) ||
                other.lastComment == lastComment) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, title, description, lastComment, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      __$$_ChatRoomCopyWithImpl<_$_ChatRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomToJson(
      this,
    );
  }
}

abstract class _ChatRoom implements ChatRoom {
  factory _ChatRoom(
      {@JsonKey(name: "uuid") required final String uuid,
      @JsonKey(name: "title") required final String title,
      @JsonKey(name: "description") required final String description,
      @JsonKey(name: "last_comment") final Comment? lastComment,
      @JsonKey(name: "notes") final String? notes}) = _$_ChatRoom;

  factory _ChatRoom.fromJson(Map<String, dynamic> json) = _$_ChatRoom.fromJson;

  @override
  @JsonKey(name: "uuid")
  String get uuid;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "last_comment")
  Comment? get lastComment;
  @override
  @JsonKey(name: "notes")
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
