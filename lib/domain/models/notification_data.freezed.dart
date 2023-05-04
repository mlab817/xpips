// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  @JsonKey(name: 'sender')
  String get sender => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject')
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sender') String sender,
      @JsonKey(name: 'subject') String subject,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? subject = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationDataCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$_NotificationDataCopyWith(
          _$_NotificationData value, $Res Function(_$_NotificationData) then) =
      __$$_NotificationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sender') String sender,
      @JsonKey(name: 'subject') String subject,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$_NotificationDataCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$_NotificationData>
    implements _$$_NotificationDataCopyWith<$Res> {
  __$$_NotificationDataCopyWithImpl(
      _$_NotificationData _value, $Res Function(_$_NotificationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? subject = null,
    Object? message = null,
  }) {
    return _then(_$_NotificationData(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationData implements _NotificationData {
  _$_NotificationData(
      {@JsonKey(name: 'sender') required this.sender,
      @JsonKey(name: 'subject') required this.subject,
      @JsonKey(name: 'message') required this.message});

  factory _$_NotificationData.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDataFromJson(json);

  @override
  @JsonKey(name: 'sender')
  final String sender;
  @override
  @JsonKey(name: 'subject')
  final String subject;
  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'NotificationData(sender: $sender, subject: $subject, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationData &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sender, subject, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      __$$_NotificationDataCopyWithImpl<_$_NotificationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDataToJson(
      this,
    );
  }
}

abstract class _NotificationData implements NotificationData {
  factory _NotificationData(
          {@JsonKey(name: 'sender') required final String sender,
          @JsonKey(name: 'subject') required final String subject,
          @JsonKey(name: 'message') required final String message}) =
      _$_NotificationData;

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$_NotificationData.fromJson;

  @override
  @JsonKey(name: 'sender')
  String get sender;
  @override
  @JsonKey(name: 'subject')
  String get subject;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}
