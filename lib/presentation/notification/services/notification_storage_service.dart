import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/notification_model.dart';

class NotificationStorageService {
  static const String _storageKey = 'notifications';

  Future<void> saveNotification(NotificationModel notification) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = await getNotifications();

      final updatedNotifications = [notification, ...notifications];

      await prefs.setString(
        _storageKey,
        jsonEncode(updatedNotifications.map((n) => n.toJson()).toList()),
      );
    } catch (e) {
      print('Error saving notification: $e');
    }
  }

  Future<List<NotificationModel>> getNotifications() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String notificationsJson = prefs.getString(_storageKey) ?? '[]';
      final List<dynamic> notifications = jsonDecode(notificationsJson);

      return notifications
          .map((json) =>
              NotificationModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting notifications: $e');
      return [];
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = await getNotifications();

      final updatedNotifications = notifications
          .map((notification) => notification.id == id
              ? notification.copyWith(isRead: true)
              : notification)
          .toList();

      await prefs.setString(
        _storageKey,
        jsonEncode(updatedNotifications.map((n) => n.toJson()).toList()),
      );
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  Future<void> deleteAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
    } catch (e) {
      print('Error deleting all notifications: $e');
    }
  }

  Future<void> deleteNotification(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = await getNotifications();

      final updatedNotifications =
          notifications.where((n) => n.id != id).toList();

      await prefs.setString(
        _storageKey,
        jsonEncode(updatedNotifications.map((n) => n.toJson()).toList()),
      );
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }
}
