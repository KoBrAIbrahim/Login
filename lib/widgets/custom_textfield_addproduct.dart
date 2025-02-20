import 'package:flutter/material.dart';

class CustomTextFeildAddProduct extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextFeildAddProduct({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
              controller: controller,
              decoration: InputDecoration(labelText: labelText),
            );
  }
}
