import 'dart:developer';
import 'package:fitness_ui/core/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  LocalNotificationService._internal();

  factory LocalNotificationService() => _instance;
  static final LocalNotificationService _instance =
      LocalNotificationService._internal();

  //  Instantiate Notifications Plugin
  FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'default_channel_id',
    'Hello notification',
    description: 'description notification',
    importance: Importance.high,
  );

  Future<void> initialize() async {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    // Android Initialization Settings
    const android = AndroidInitializationSettings("@mipmap/launcher_icon");
    // IOS Initialization Settings
    final iOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        log("[ios notification]: id=$id title=$title body=$body");
      },
    );
    // Initialization Settings
    final settings = InitializationSettings(android: android, iOS: iOS);

    // When app is in closed
    final notificationAppLaunchDetails =
        await _notificationsPlugin.getNotificationAppLaunchDetails();

    // Create notification channel
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      log("[Notification]: Notification LaunchApp");
      final payload =
          notificationAppLaunchDetails?.notificationResponse?.payload;
      openRemoteMessage(payload);
    } else {
      // Initialize Notifications Plugin
      await _notificationsPlugin.initialize(
        settings,
        onDidReceiveNotificationResponse: (response) async {
          log("[onDidReceive] : ${response.payload}");
          openRemoteMessage(response.payload);
        },
      ).then((_) {
        log("[FCM] Setup success");
      }).catchError((onError) {
        log("[FCM] Setup error: $onError");
      });
    }
  }

  void openRemoteMessage(String? payload) {
    if (payload != null && payload.isNotEmpty) {}
  }

  Future<void> showNotifications(notification) async {
    try {
      int id = notification.hashCode;
      String title = notification.title ?? '';
      String body = notification.body ?? '';
      String payload = 'payload';

      final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: AppColor.primary,
          importance: Importance.max,
          priority: Priority.max,
        ),
        iOS: const DarwinNotificationDetails(
            sound: "default",
            presentAlert: true,
            presentBadge: true,
            presentSound: true),
      );

      await _notificationsPlugin.show(id, title, body, notificationDetails,
          payload: payload);
    } catch (e) {
      log("[showNotification] error: $e");
    }
  }

  Future<void> showNotificationData(Map<String, dynamic> message) async {
    try {
      final Map<String, dynamic> data = message;

      const int id = 0;
      String title = data['title'] ?? '';
      String body = data['body'] ?? '';
      String payload = 'payload';

      final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            color: AppColor.primary,
            importance: Importance.max,
            priority: Priority.max),
        iOS: const DarwinNotificationDetails(
            sound: "default",
            presentAlert: true,
            presentBadge: true,
            presentSound: true),
      );

      await _notificationsPlugin.show(id, title, body, notificationDetails,
          payload: payload);
    } catch (e) {
      log("[showNotification] error: $e");
    }
  }

  // Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotification() async {
    return await _notificationsPlugin.pendingNotificationRequests();
  }

  // get active notifications
  Future<List<ActiveNotification>> getActiveNotifications() async {
    return await _notificationsPlugin.getActiveNotifications();
  }

  // Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }

  Future<void> zonedScheduleNotification({
    String? title,
    String? body,
    String? payload,
    required tz.TZDateTime scheduledDate,
  }) async {
    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        color: Colors.pinkAccent,
        importance: Importance.max,
        priority: Priority.max,
      ),
      iOS: const DarwinNotificationDetails(
          sound: "default",
          presentAlert: true,
          presentBadge: true,
          presentSound: true),
    );
    try {
      await _notificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        scheduledDate,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      log("[zonedScheduleNotification] error: $e");
    }
  }
}
