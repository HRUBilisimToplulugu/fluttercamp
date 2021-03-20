import 'package:flutter/material.dart';
import 'package:fluttercamp/core/widgets/custom_button.dart';

class SignInButton extends CustomButton {
  SignInButton(
      {this.text,
      required this.onPressed,
      required this.width,
      this.textColor,
      this.buttonColor,
      this.height: 40})
      : super(
            child: Container(
              alignment: Alignment.center,
              height: height,
              width: width,
              child: Text(
                '$text',
                style: TextStyle(color: textColor),
              ),
            ),
            onPressed: onPressed,
            color: buttonColor);
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
}
