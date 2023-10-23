import 'package:flutter/material.dart';

import '../../constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.highlighColor = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final bool highlighColor;

  Color get backgroundColor => highlighColor ? darkBrown : Colors.white;
  Color get textColor => highlighColor ? Colors.white : darkBrown;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: darkBrown),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.fromLTRB(55, 15, 55, 15),
        ),
        shape: MaterialStateProperty.all(
          // StadiumBorder(),
          const OvalBorder(),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
