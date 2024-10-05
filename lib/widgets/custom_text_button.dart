import 'package:flutter/material.dart';

final class CustomTextButton extends StatelessWidget {
  final String label;
  final TextStyle textStyle;
  final Size size;
  final EdgeInsetsGeometry padding;
  final double radius;
  final VoidCallback? onPressed;

  const CustomTextButton({
    required this.label,
    required this.textStyle,
    required this.size,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.radius = 10.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: size,
        maximumSize: size,
        fixedSize: size,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
