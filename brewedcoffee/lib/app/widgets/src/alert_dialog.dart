import 'package:brewedcoffee/app/coffee_router.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog(String message, [String? title]) async {
  return showDialog<void>(
    context: CoffeeRouter.instance.navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title ?? 'Error!'),
        content: Text(message),
      );
    },
  );
}
