import 'dart:developer';

import 'package:brewedcoffee/coffee/widgets/src/alert_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class MessagingService {
  factory MessagingService() => _service;

  // Singleton setup: prevents multiple instances of this class.
  MessagingService._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final MessagingService _service = MessagingService._();

  static MessagingService get instance => _service;

  Future<void> initialize() async {
    final settings = await _requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _getToken();
      _firebaseMessagingForgroundHandler();
    }
  }

  Future<void> subscribeToTopic(String topic) {
    return _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) {
    return _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future<bool> isPremissionEnabled(AuthorizationStatus status) async {
    final settings = await _firebaseMessaging.getNotificationSettings();
    return settings.authorizationStatus == status;
  }

  Future<NotificationSettings> _requestPermission() async {
    final settings = await _firebaseMessaging.requestPermission();
    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }

    return settings;
  }

  void _firebaseMessagingForgroundHandler() {
    FirebaseMessaging.onMessage.listen(
      (
        RemoteMessage message,
      ) {
        log('Message data: ${message.data}');
        // custom message data: {price: 10, coffee: latte2}
        if (message.notification != null) {
          showAlertDialog(
            message.notification!.body ?? '',
            message.notification?.title,
          );
        }
      },
    );
  }

  void showMessage(RemoteMessage remoteMessage) {
    showAlertDialog(remoteMessage.messageId ?? '');
  }

  String? get userDeviceToken {
    return _token;
  }

  String? _token;

  void setToken(String token) {
    log('FCM Token: $token');
    _token = token;
  }

  Future<void> _getToken() async {
    final token = await _firebaseMessaging.getToken();
    if (token != null) {
      _token = token;
    }

    _firebaseMessaging.onTokenRefresh.listen(setToken);
  }

  Future<void> deleteToken() async {
    await _firebaseMessaging.deleteToken();
  }
}
