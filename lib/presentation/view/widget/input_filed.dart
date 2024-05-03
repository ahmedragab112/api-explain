import 'package:flutter/material.dart';

class InputFiled extends StatelessWidget {
  const InputFiled({super.key, required this.hintText, this.controller});
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return  TextField(
controller: controller,
      decoration: InputDecoration(
        hintText:hintText,
      ),
    );
  }
}
