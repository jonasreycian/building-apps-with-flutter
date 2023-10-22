import 'package:flutter/material.dart';

SnackBar loadingSnackBar({
  String text = 'Loading...',
}) {
  return SnackBar(
    content: Row(
      children: <Widget>[
        const CircularProgressIndicator(),
        const SizedBox(
          width: 20,
        ),
        Text(text),
      ],
    ),
  );
}
