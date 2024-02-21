import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCardWidget extends StatelessWidget {
  GlassCardWidget({
    Key? key,
    this.padding,
    this.height,
    this.width,
    required this.child,
  }) : super(key: key);

  EdgeInsets? padding;
  double? height;
  double? width;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 25,
          spreadRadius: 16,
          color: Colors.black.withOpacity(0.2),
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 5,
            sigmaX: 5,
          ),
          child: Container(
            padding: padding,
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.2),
                )),
            child: child,
          ),
        ),
      ),
    );
  }
}
