import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
class CustomSquareButton {
  CustomSquareButton._();

  static squareButton({void Function()? onTap, 
      BoxBorder? border,
      BorderRadiusGeometry? borderRadius,
      Gradient? gradient,
      Color? color,
      Widget? child,
      EdgeInsetsGeometry? padding
     }
      ){
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: border ?? Border.all(color: RsColor.blackWithOpacity),
            color: color,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
            gradient: gradient ?? LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [RsColor.trans, RsColor.trans]),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }


}
