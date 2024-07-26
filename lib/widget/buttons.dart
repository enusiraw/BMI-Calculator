import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends StatelessWidget {
  final String label;
  final Color? color;
  final Icon? icon;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const Buttons({
    required this.label,
    required this.onPressed,
    this.color,
    this.icon,
    required this.height,
    required this.width,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null && label.isNotEmpty) SizedBox(width: 8.w), // Adjust spacing if both icon and label are present
            Text(
              label,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
