import 'package:flutter/material.dart';

class CustomGradientBorder extends InputBorder {
  final Gradient gradient;
  final double width;
  final BorderRadius borderRadius;

  const CustomGradientBorder({
    required this.gradient,
    this.width = 1.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    super.borderSide = BorderSide.none,
  });

  @override
  InputBorder copyWith({BorderSide? borderSide}) {
    return CustomGradientBorder(
      gradient: gradient,
      width: width,
      borderRadius: borderRadius,
      borderSide: borderSide ?? this.borderSide,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.toRRect(rect.deflate(width)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.toRRect(rect));
  }

  @override
  bool get isOutline => true;

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
        double gapExtent = 0.0,
        double gapPercentage = 0.0,
        TextDirection? textDirection}) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(borderRadius.toRRect(rect), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return CustomGradientBorder(
      gradient: gradient,
      width: width * t,
      borderRadius: borderRadius * t,
    );
  }
}