import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

class InAppMessagingService {
  final _firebaseInAppMessaging = FirebaseInAppMessaging.instance;

  // Singleton setup: prevents multiple instances of this class.
  InAppMessagingService._();
  static final InAppMessagingService _service = InAppMessagingService._();
  factory InAppMessagingService() => _service;

  static InAppMessagingService get instance => _service;

  // trigger an Analytics events
  Future<void> triggerEvent(String event) async {
    return _firebaseInAppMessaging.triggerEvent(event);
  }

  /// Enables or disables suppression of message displays.
  Future<void> setMessagesSuppressed(bool suppress) async {
    return _firebaseInAppMessaging.setMessagesSuppressed(suppress);
  }
}
