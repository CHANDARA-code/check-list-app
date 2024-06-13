import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  final TextStyle titleStyle;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.backgroundColor,
    this.iconColor = Colors.white,
    this.iconSize = 24.0,
    this.titleStyle = const TextStyle(color: Colors.black, fontSize: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            const SizedBox(width: 8.0),
            Text(
              title,
              style: titleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
