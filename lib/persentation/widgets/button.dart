import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hiddengems/common/constants.dart';

class Button extends StatelessWidget {
  final String name;
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;

  const Button(
      {required this.name,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: kPurple),
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        child: Text(
          name,
          style: kButton.copyWith(color: textColor),
        ),
      ),
    );
  }
}
