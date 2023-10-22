import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

class InAppMessagingService {
  factory InAppMessagingService() => _service;

  // Singleton setup: prevents multiple instances of this class.
  InAppMessagingService._();
  final _firebaseInAppMessaging = FirebaseInAppMessaging.instance;
  static final InAppMessagingService _service = InAppMessagingService._();

  static InAppMessagingService get instance => _service;

  // trigger an Analytics events
  Future<void> triggerEvent(String event) async {
    return _firebaseInAppMessaging.triggerEvent(event);
  }

  /// Enables or disables suppression of message displays.
  Future<void> setMessagesSuppressed({bool suppress = true}) async {
    return _firebaseInAppMessaging.setMessagesSuppressed(suppress);
  }
}
