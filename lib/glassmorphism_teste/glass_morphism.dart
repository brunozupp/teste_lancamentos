import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {

  final double blur;
  final double opacity;
  final Widget child;
  final BorderRadius borderRadius;
  final Color color;
  final BoxBorder? border;

  const GlassMorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.color = Colors.white,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: borderRadius,
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
