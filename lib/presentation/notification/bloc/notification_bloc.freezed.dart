// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NotificationEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NotificationEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SaveNotificationImplCopyWith<$Res> {
  factory _$$SaveNotificationImplCopyWith(_$SaveNotificationImpl value,
          $Res Function(_$SaveNotificationImpl) then) =
      __$$SaveNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationModel notification});

  $NotificationModelCopyWith<$Res> get notification;
}

/// @nodoc
class __$$SaveNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$SaveNotificationImpl>
    implements _$$SaveNotificationImplCopyWith<$Res> {
  __$$SaveNotificationImplCopyWithImpl(_$SaveNotificationImpl _value,
      $Res Function(_$SaveNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$SaveNotificationImpl(
      null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationModel,
    ));
  }

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationModelCopyWith<$Res> get notification {
    return $NotificationModelCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }
}

/// @nodoc

class _$SaveNotificationImpl
    with DiagnosticableTreeMixin
    implements _SaveNotification {
  const _$SaveNotificationImpl(this.notification);

  @override
  final NotificationModel notification;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.saveNotification(notification: $notification)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationEvent.saveNotification'))
      ..add(DiagnosticsProperty('notification', notification));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveNotificationImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveNotificationImplCopyWith<_$SaveNotificationImpl> get copyWith =>
      __$$SaveNotificationImplCopyWithImpl<_$SaveNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) {
    return saveNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) {
    return saveNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) {
    if (saveNotification != null) {
      return saveNotification(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) {
    return saveNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) {
    return saveNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) {
    if (saveNotification != null) {
      return saveNotification(this);
    }
    return orElse();
  }
}

abstract class _SaveNotification implements NotificationEvent {
  const factory _SaveNotification(final NotificationModel notification) =
      _$SaveNotificationImpl;

  NotificationModel get notification;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveNotificationImplCopyWith<_$SaveNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNotificationsImplCopyWith<$Res> {
  factory _$$GetNotificationsImplCopyWith(_$GetNotificationsImpl value,
          $Res Function(_$GetNotificationsImpl) then) =
      __$$GetNotificationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$GetNotificationsImpl>
    implements _$$GetNotificationsImplCopyWith<$Res> {
  __$$GetNotificationsImplCopyWithImpl(_$GetNotificationsImpl _value,
      $Res Function(_$GetNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsImpl
    with DiagnosticableTreeMixin
    implements _GetNotifications {
  const _$GetNotificationsImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.getNotifications()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NotificationEvent.getNotifications'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNotificationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) {
    return getNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) {
    return getNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) {
    return getNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) {
    return getNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(this);
    }
    return orElse();
  }
}

abstract class _GetNotifications implements NotificationEvent {
  const factory _GetNotifications() = _$GetNotificationsImpl;
}

/// @nodoc
abstract class _$$MarkAsReadImplCopyWith<$Res> {
  factory _$$MarkAsReadImplCopyWith(
          _$MarkAsReadImpl value, $Res Function(_$MarkAsReadImpl) then) =
      __$$MarkAsReadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MarkAsReadImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$MarkAsReadImpl>
    implements _$$MarkAsReadImplCopyWith<$Res> {
  __$$MarkAsReadImplCopyWithImpl(
      _$MarkAsReadImpl _value, $Res Function(_$MarkAsReadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MarkAsReadImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsReadImpl with DiagnosticableTreeMixin implements _MarkAsRead {
  const _$MarkAsReadImpl(this.id);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.markAsRead(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationEvent.markAsRead'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsReadImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      __$$MarkAsReadImplCopyWithImpl<_$MarkAsReadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) {
    return markAsRead(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) {
    return markAsRead?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) {
    return markAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) {
    return markAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(this);
    }
    return orElse();
  }
}

abstract class _MarkAsRead implements NotificationEvent {
  const factory _MarkAsRead(final String id) = _$MarkAsReadImpl;

  String get id;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAllImplCopyWith<$Res> {
  factory _$$DeleteAllImplCopyWith(
          _$DeleteAllImpl value, $Res Function(_$DeleteAllImpl) then) =
      __$$DeleteAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAllImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$DeleteAllImpl>
    implements _$$DeleteAllImplCopyWith<$Res> {
  __$$DeleteAllImplCopyWithImpl(
      _$DeleteAllImpl _value, $Res Function(_$DeleteAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteAllImpl with DiagnosticableTreeMixin implements _DeleteAll {
  const _$DeleteAllImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.deleteAll()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NotificationEvent.deleteAll'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) {
    return deleteAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) {
    return deleteAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) {
    if (deleteAll != null) {
      return deleteAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) {
    return deleteAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) {
    return deleteAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) {
    if (deleteAll != null) {
      return deleteAll(this);
    }
    return orElse();
  }
}

abstract class _DeleteAll implements NotificationEvent {
  const factory _DeleteAll() = _$DeleteAllImpl;
}

/// @nodoc
abstract class _$$DeleteNotificationImplCopyWith<$Res> {
  factory _$$DeleteNotificationImplCopyWith(_$DeleteNotificationImpl value,
          $Res Function(_$DeleteNotificationImpl) then) =
      __$$DeleteNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$DeleteNotificationImpl>
    implements _$$DeleteNotificationImplCopyWith<$Res> {
  __$$DeleteNotificationImplCopyWithImpl(_$DeleteNotificationImpl _value,
      $Res Function(_$DeleteNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteNotificationImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteNotificationImpl
    with DiagnosticableTreeMixin
    implements _DeleteNotification {
  const _$DeleteNotificationImpl(this.id);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.deleteNotification(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationEvent.deleteNotification'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotificationImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNotificationImplCopyWith<_$DeleteNotificationImpl> get copyWith =>
      __$$DeleteNotificationImplCopyWithImpl<_$DeleteNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) {
    return deleteNotification(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) {
    return deleteNotification?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) {
    if (deleteNotification != null) {
      return deleteNotification(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) {
    return deleteNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) {
    return deleteNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) {
    if (deleteNotification != null) {
      return deleteNotification(this);
    }
    return orElse();
  }
}

abstract class _DeleteNotification implements NotificationEvent {
  const factory _DeleteNotification(final String id) = _$DeleteNotificationImpl;

  String get id;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNotificationImplCopyWith<_$DeleteNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewNotificationImplCopyWith<$Res> {
  factory _$$NewNotificationImplCopyWith(_$NewNotificationImpl value,
          $Res Function(_$NewNotificationImpl) then) =
      __$$NewNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationModel notification});

  $NotificationModelCopyWith<$Res> get notification;
}

/// @nodoc
class __$$NewNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$NewNotificationImpl>
    implements _$$NewNotificationImplCopyWith<$Res> {
  __$$NewNotificationImplCopyWithImpl(
      _$NewNotificationImpl _value, $Res Function(_$NewNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$NewNotificationImpl(
      null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationModel,
    ));
  }

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationModelCopyWith<$Res> get notification {
    return $NotificationModelCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }
}

/// @nodoc

class _$NewNotificationImpl
    with DiagnosticableTreeMixin
    implements _NewNotification {
  const _$NewNotificationImpl(this.notification);

  @override
  final NotificationModel notification;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationEvent.newNotification(notification: $notification)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationEvent.newNotification'))
      ..add(DiagnosticsProperty('notification', notification));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewNotificationImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewNotificationImplCopyWith<_$NewNotificationImpl> get copyWith =>
      __$$NewNotificationImplCopyWithImpl<_$NewNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(NotificationModel notification) saveNotification,
    required TResult Function() getNotifications,
    required TResult Function(String id) markAsRead,
    required TResult Function() deleteAll,
    required TResult Function(String id) deleteNotification,
    required TResult Function(NotificationModel notification) newNotification,
  }) {
    return newNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(NotificationModel notification)? saveNotification,
    TResult? Function()? getNotifications,
    TResult? Function(String id)? markAsRead,
    TResult? Function()? deleteAll,
    TResult? Function(String id)? deleteNotification,
    TResult? Function(NotificationModel notification)? newNotification,
  }) {
    return newNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(NotificationModel notification)? saveNotification,
    TResult Function()? getNotifications,
    TResult Function(String id)? markAsRead,
    TResult Function()? deleteAll,
    TResult Function(String id)? deleteNotification,
    TResult Function(NotificationModel notification)? newNotification,
    required TResult orElse(),
  }) {
    if (newNotification != null) {
      return newNotification(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SaveNotification value) saveNotification,
    required TResult Function(_GetNotifications value) getNotifications,
    required TResult Function(_MarkAsRead value) markAsRead,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_DeleteNotification value) deleteNotification,
    required TResult Function(_NewNotification value) newNotification,
  }) {
    return newNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SaveNotification value)? saveNotification,
    TResult? Function(_GetNotifications value)? getNotifications,
    TResult? Function(_MarkAsRead value)? markAsRead,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_DeleteNotification value)? deleteNotification,
    TResult? Function(_NewNotification value)? newNotification,
  }) {
    return newNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SaveNotification value)? saveNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_MarkAsRead value)? markAsRead,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_DeleteNotification value)? deleteNotification,
    TResult Function(_NewNotification value)? newNotification,
    required TResult orElse(),
  }) {
    if (newNotification != null) {
      return newNotification(this);
    }
    return orElse();
  }
}

abstract class _NewNotification implements NotificationEvent {
  const factory _NewNotification(final NotificationModel notification) =
      _$NewNotificationImpl;

  NotificationModel get notification;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewNotificationImplCopyWith<_$NewNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NotificationState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NotificationState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NotificationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationModel> notifications});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$LoadedImpl(
      null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl(final List<NotificationModel> notifications)
      : _notifications = notifications;

  final List<NotificationModel> _notifications;
  @override
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.loaded(notifications: $notifications)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationState.loaded'))
      ..add(DiagnosticsProperty('notifications', notifications));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements NotificationState {
  const factory _Loaded(final List<NotificationModel> notifications) =
      _$LoadedImpl;

  List<NotificationModel> get notifications;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<NotificationModel> notifications) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<NotificationModel> notifications)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<NotificationModel> notifications)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NotificationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
