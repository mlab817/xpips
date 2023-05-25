// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return _Notifications.fromJson(json);
}

/// @nodoc
mixin _$Notifications {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  NotificationData get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'read_at')
  DateTime? get readAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsCopyWith<Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCopyWith<$Res> {
  factory $NotificationsCopyWith(
          Notifications value, $Res Function(Notifications) then) =
      _$NotificationsCopyWithImpl<$Res, Notifications>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'data') NotificationData data,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'read_at') DateTime? readAt});

  $NotificationDataCopyWith<$Res> get data;
}

/// @nodoc
class _$NotificationsCopyWithImpl<$Res, $Val extends Notifications>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? createdAt = null,
    Object? readAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationData,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationDataCopyWith<$Res> get data {
    return $NotificationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationsCopyWith<$Res>
    implements $NotificationsCopyWith<$Res> {
  factory _$$_NotificationsCopyWith(
          _$_Notifications value, $Res Function(_$_Notifications) then) =
      __$$_NotificationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'data') NotificationData data,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'read_at') DateTime? readAt});

  @override
  $NotificationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_NotificationsCopyWithImpl<$Res>
    extends _$NotificationsCopyWithImpl<$Res, _$_Notifications>
    implements _$$_NotificationsCopyWith<$Res> {
  __$$_NotificationsCopyWithImpl(
      _$_Notifications _value, $Res Function(_$_Notifications) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? createdAt = null,
    Object? readAt = freezed,
  }) {
    return _then(_$_Notifications(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationData,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notifications implements _Notifications {
  _$_Notifications(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'data') required this.data,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'read_at') this.readAt});

  factory _$_Notifications.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'data')
  final NotificationData data;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'read_at')
  final DateTime? readAt;

  @override
  String toString() {
    return 'Notifications(id: $id, data: $data, createdAt: $createdAt, readAt: $readAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notifications &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, data, createdAt, readAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsCopyWith<_$_Notifications> get copyWith =>
      __$$_NotificationsCopyWithImpl<_$_Notifications>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsToJson(
      this,
    );
  }
}

abstract class _Notifications implements Notifications {
  factory _Notifications(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'data') required final NotificationData data,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'read_at') final DateTime? readAt}) = _$_Notifications;

  factory _Notifications.fromJson(Map<String, dynamic> json) =
      _$_Notifications.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'data')
  NotificationData get data;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'read_at')
  DateTime? get readAt;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsCopyWith<_$_Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}
