import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';
import 'package:notification_sample/presentation/notification/services/notification_storage_service.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationStorageService _storageService;

  NotificationBloc(this._storageService)
      : super(const NotificationState.initial()) {
    on<NotificationEvent>((event, emit) async {
      await event.map(
        started: (e) async => await _onStarted(emit),
        saveNotification: (e) async =>
            await _onSaveNotification(emit, e.notification),
        getNotifications: (e) async => await _onGetNotifications(emit),
        markAsRead: (e) async => await _onMarkAsRead(emit, e.id),
        deleteAll: (e) async => await _onDeleteAll(emit),
        deleteNotification: (e) async =>
            await _onDeleteNotification(emit, e.id),
        newNotification: (e) async =>
            await _onNewNotification(emit, e.notification),
      );
    });
  }

  Future<void> _onStarted(Emitter<NotificationState> emit) async {
    emit(const NotificationState.loading());
    try {
      final notifications = await _storageService.getNotifications();
      emit(NotificationState.loaded(notifications));
    } catch (e) {
      emit(const NotificationState.error('Failed to load notifications'));
    }
  }

  Future<void> _onSaveNotification(
      Emitter<NotificationState> emit, NotificationModel notification) async {
    emit(const NotificationState.loading());
    try {
      await _storageService.saveNotification(notification);
      await _onGetNotifications(emit); // Reuse the method to load notifications
    } catch (e) {
      emit(const NotificationState.error('Failed to save notification'));
    }
  }

  Future<void> _onGetNotifications(Emitter<NotificationState> emit) async {
    emit(const NotificationState.loading());
    try {
      final notifications = await _storageService.getNotifications();
      emit(NotificationState.loaded(notifications));
    } catch (e) {
      emit(const NotificationState.error('Failed to fetch notifications'));
    }
  }

  Future<void> _onMarkAsRead(Emitter<NotificationState> emit, String id) async {
    try {
      await _storageService.markAsRead(id);
      await _onGetNotifications(emit); // Reuse the method to load notifications
    } catch (e) {
      emit(const NotificationState.error('Failed to mark as read'));
    }
  }

  Future<void> _onDeleteAll(Emitter<NotificationState> emit) async {
    try {
      await _storageService.deleteAll();
      emit(const NotificationState.loaded([]));
    } catch (e) {
      emit(const NotificationState.error('Failed to delete all notifications'));
    }
  }

  Future<void> _onDeleteNotification(
      Emitter<NotificationState> emit, String id) async {
    try {
      await _storageService.deleteNotification(id);
      await _onGetNotifications(emit); // Reuse the method to load notifications
    } catch (e) {
      emit(const NotificationState.error('Failed to delete notification'));
    }
  }

  Future<void> _onNewNotification(
      Emitter<NotificationState> emit, NotificationModel notification) async {
    await _onSaveNotification(emit, notification);
  }
}
