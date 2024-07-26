import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final Icon? icon;
  final VoidCallback? onTap;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const CustomContainer({
    super.key,
    required this.height,
    required this.width,
    this.color,
    this.padding,
    this.icon,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: child,
      ),
    );
  }
}
