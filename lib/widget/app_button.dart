import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    required this.iconData,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(iconData, color: foregroundColor),
      label: Text(label, style: TextStyle(color: foregroundColor)),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
