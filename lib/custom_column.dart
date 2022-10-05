import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  CustomColumn({this.text, required this.child});
  final String? text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: const TextStyle(fontSize: 18),
        ),
        child
      ],
    );
  }
}
