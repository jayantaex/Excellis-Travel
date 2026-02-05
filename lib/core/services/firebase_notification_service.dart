import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../constants/app_styles.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await FirebaseNotificationService.instance.setupFlutterNotifications();
  await FirebaseNotificationService.instance.showNotification(message);
}

class FirebaseNotificationService {
  FirebaseNotificationService._();
  static FirebaseNotificationService instance = FirebaseNotificationService._();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _requestPermission();
    await _setupMessageHandlers();
  }

  Future<String?> getFcmToken() async {
    final String? token = await _messaging.getToken();
    return token;
  }

  Future<void> _requestPermission() async {
    final NotificationSettings settings = await _messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else {
      log('User denied permission');
    }
  }

  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
    final RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      await _handleBackgroundMessage(initialMessage);
    }
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) return;
    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    try {
      final int notificationId = message.notification?.hashCode ?? 0;
      final String title = message.notification?.title ?? '';
      final String body = message.notification?.body ?? '';

      const AndroidNotificationDetails andriod = AndroidNotificationDetails(
          'Excellis Travel Notification Channel',
          'Excellis Travel Notification ',
          importance: Importance.max,
          priority: Priority.high,
          color: AppColors.primary,
          colorized: true,
          icon: '@mipmap/ic_launcher');

      const DarwinNotificationDetails ios = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      await _localNotifications.show(
          id: notificationId,
          title: title,
          body: body,
          notificationDetails:
              const NotificationDetails(android: andriod, iOS: ios));
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    log('Background message: ${message.data}');
    await showNotification(message);
  }
}
