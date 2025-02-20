import 'package:flutter/material.dart';

class CustomUsernameText extends StatelessWidget {
  final String content;
  final double fontSize;

  const CustomUsernameText({
    Key? key,
    required this.content,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
