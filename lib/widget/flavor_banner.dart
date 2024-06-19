import 'package:flutter/material.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final bool show;
  final String message;

  const FlavorBanner({
    required this.child,
    this.show = true,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            child: child,
            location: BannerLocation.topStart,
            message: message,
            color: Colors.green.withOpacity(0.6),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
          )
        : child;
  }
}
