import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, this.color = Colors.white30, this.icon});
  final VoidCallback? onTap;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: color),
        child: Icon(icon),
      ),
    );
  }
}
