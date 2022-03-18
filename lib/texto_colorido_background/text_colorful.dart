import 'dart:ui';

import 'package:flutter/material.dart';

class TextColorful extends StatelessWidget {

  final Text text;

  const TextColorful({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        blendMode: BlendMode.exclusion,
        filter: ImageFilter.compose(
          outer: ImageFilter.blur(
            sigmaX: 1.0,
            sigmaY: 1.0,
          ),
          inner: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
        ),
        child: Container(
          child: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
