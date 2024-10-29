part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.started() = _Started;
  const factory NotificationEvent.saveNotification(
      NotificationModel notification) = _SaveNotification;
  const factory NotificationEvent.getNotifications() = _GetNotifications;
  const factory NotificationEvent.markAsRead(String id) = _MarkAsRead;
  const factory NotificationEvent.deleteAll() = _DeleteAll;
  const factory NotificationEvent.deleteNotification(String id) =
      _DeleteNotification;
  const factory NotificationEvent.newNotification(
      NotificationModel notification) = _NewNotification;
}
