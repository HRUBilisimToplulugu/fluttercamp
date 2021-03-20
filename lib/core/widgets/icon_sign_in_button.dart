import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercamp/core/widgets/custom_button.dart';

class IconSignButton extends CustomButton {
  final String? imagePath;
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  IconSignButton(
      {this.imagePath,
      this.text,
      this.buttonColor,
      this.textColor,
      required this.onPressed,
      this.width: 50,
      this.height: 50})
      : super(
          child: Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(imagePath!),
                Text(
                  '$text',
                  style: TextStyle(color: textColor),
                ),
                Opacity(
                  opacity: 0,
                  child: Image.asset(imagePath),
                )
              ],
            ),
          ),
          onPressed: onPressed,
          color: buttonColor,
        );
}
