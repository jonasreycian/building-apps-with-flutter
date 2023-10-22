import 'dart:async';
import 'dart:developer';

import 'package:brewedcoffee/app/app.dart';
import 'package:brewedcoffee/app/helpers/src/handle_background_message.dart';
import 'package:brewedcoffee/bootstrap.dart';
import 'package:brewedcoffee/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // TODO: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );

  await bootstrap(() => const App());

  // await runZoned<Future<void>>(
  //   () async {
  //     Bloc.observer = const AppBlocObserver();

  //     // Add cross-flavor configuration here
  //     await SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.portraitUp,
  //     ]);

  //     // TODO: Initialize Firebase
  //     await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform,
  //     );

  //     FirebaseMessaging.onBackgroundMessage(
  //       firebaseMessagingBackgroundHandler,
  //     );

  //     await bootstrap(() => const App());
  //   },
  //   onError: (Function error) async {
  //     if (kDebugMode) {
  //       // in development, print error and stack trace
  //       print('$error');
  //     } else {
  //       log('Caught Dart Error!');
  //       // report to a error tracking system in production
  //     }
  //   },
  //   zoneSpecification: ZoneSpecification(
  //     print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
  //       if (kDebugMode) {
  //         print(line);
  //       }
  //     },
  //   ),
  // );
}
