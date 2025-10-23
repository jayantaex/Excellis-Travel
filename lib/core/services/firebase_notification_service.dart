import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await FirebaseNotificationService.instance.setupFlutterNotifications();
  await FirebaseNotificationService.instance.showNotification(message);
}

class FirebaseNotificationService {
  FirebaseNotificationService._();
  static FirebaseNotificationService instance = FirebaseNotificationService._();
  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _requestPermission();
    await _setupMessageHandlers();
    final token = await _messaging.getToken();
    log('FCM Token: $token');
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
    log('Permission status: ${settings.authorizationStatus}');
  }

  Future<void> _setupMessageHandlers() async {
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) return;
    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    int notificationId = DateTime.now().millisecondsSinceEpoch;
    String title = message.notification?.title ?? '';
    String body = message.notification?.body ?? '';
    const AndroidNotificationDetails andriod = AndroidNotificationDetails(
      'RL-NCH',
      'RL-Notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails ios = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    _localNotifications.show(notificationId, title, body,
        const NotificationDetails(android: andriod, iOS: ios));
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    log('Background message: ${message.data}');
  }
}
