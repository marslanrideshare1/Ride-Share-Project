import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class RsEbTheme{
  RsEbTheme._();

  /// Light Theme.
  static  get RideShareLightElevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      foregroundColor: RsColor.white,
      backgroundColor: RsColor.primaryFirst,
      disabledForegroundColor: RsColor.grey,
      disabledBackgroundColor: RsColor.grey,
      side:  BorderSide(color: RsColor.blackWithOpacity),
      padding: EdgeInsets.symmetric(vertical: 10),
      iconColor: RsColor.black,
      textStyle: TextStyle(color: RsColor.black, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: ""),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    ),
  );

  // Dark Theme.
  static  get RideShareDarkElevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      foregroundColor: RsColor.white,
      backgroundColor: RsColor.primaryFirst,
      disabledForegroundColor: RsColor.grey,
      disabledBackgroundColor: RsColor.grey,
      side:  BorderSide(color: RsColor.whiteWithOpacity),
      iconColor: RsColor.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      textStyle: TextStyle(color: RsColor.white, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: ""),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
    ),
  );
}