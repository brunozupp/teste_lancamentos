import 'package:flutter/material.dart';

class TextColorful2 extends StatelessWidget {

  final Widget text;
  final Gradient gradient;
  
  const TextColorful2({
    Key? key,
    required this.text,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: text,
    );
  }
}