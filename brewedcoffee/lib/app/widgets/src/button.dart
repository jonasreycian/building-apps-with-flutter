import 'package:brewedcoffee/app/constants.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.text,
    super.key,
    this.onPressed,
    this.highlighColor = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool highlighColor;

  Color get backgroundColor {
    return highlighColor ? darkBrown : Colors.white;
  }

  Color get textColor {
    return highlighColor ? Colors.white : darkBrown;
  }

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
          const StadiumBorder(),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
