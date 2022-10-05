import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {required this.child, this.height, this.width, this.onTap, this.color});
  final VoidCallback? onTap;
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: child,
      ),
    );
  }
}
