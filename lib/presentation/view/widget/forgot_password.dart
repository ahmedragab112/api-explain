import 'package:flutter/material.dart';

class MoveToOtherPage extends StatelessWidget {
  const MoveToOtherPage({
    super.key,
    required this.widget, required this.text,
  });
  final Widget widget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => widget,
              ));
        },
        child:  Text(
         text,
          style: const TextStyle(color: Colors.blue),
        ));
  }
}
