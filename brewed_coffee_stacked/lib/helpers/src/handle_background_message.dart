import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void> firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  // we must handle our message here!
  // for example to update UI or to do something in background silently
  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
  }
}
