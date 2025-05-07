import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class RsTextTheme{
  RsTextTheme._();

  // This Light Text Theme.
  static TextTheme rideShareLightTextTheme = TextTheme(
    /// This is heading.
    headlineLarge: const TextStyle().copyWith(color: RsColor.black, fontSize: 32.0, fontWeight: FontWeight.bold, ),
    headlineMedium: const TextStyle().copyWith(color: RsColor.black, fontSize: 24.0, fontWeight: FontWeight.w600, ),
    headlineSmall: const TextStyle().copyWith(color: RsColor.black, fontSize: 18.0, fontWeight: FontWeight.w600, ),

    /// This is title.
    titleLarge: const TextStyle().copyWith(color: RsColor.black, fontSize: 16.0, fontWeight: FontWeight.w600, ),
    titleMedium: const TextStyle().copyWith(color: RsColor.black, fontSize: 16.0, fontWeight: FontWeight.w500, ),
    titleSmall: const TextStyle().copyWith(color: RsColor.black, fontSize: 16.0, fontWeight: FontWeight.w400, ),

    /// This is body.
    bodyLarge: const TextStyle().copyWith(color: RsColor.black, fontSize: 14.0, fontWeight: FontWeight.w500, ),
    bodyMedium: const TextStyle().copyWith(color: RsColor.black, fontSize: 14.0, fontWeight: FontWeight.normal, ),
    bodySmall: const TextStyle().copyWith(color: RsColor.blackWithOpacity, fontSize: 14.0, fontWeight: FontWeight.w500, ),

    /// This is label.
    labelLarge: const TextStyle().copyWith(color: RsColor.black, fontSize: 12.0, fontWeight: FontWeight.normal, ),
    labelMedium: const TextStyle().copyWith(color: RsColor.blackWithOpacity, fontSize: 120, fontWeight: FontWeight.normal, ),
    labelSmall: const TextStyle().copyWith(color: RsColor.blackWithOpacity, fontSize: 12.0, fontWeight: FontWeight.normal, ),

  );


  // This Dark Text Theme.
  static TextTheme rideShareDarkTextTheme = TextTheme(

    /// This is heading.
    headlineLarge: const TextStyle().copyWith(color: RsColor.white, fontSize: 32.0, fontWeight: FontWeight.bold, ),
    headlineMedium: const TextStyle().copyWith(color: RsColor.white, fontSize: 24.0, fontWeight: FontWeight.w600, ),
    headlineSmall: const TextStyle().copyWith(color: RsColor.white, fontSize: 18.0, fontWeight: FontWeight.w600, ),

    /// This is title.
    titleLarge: const TextStyle().copyWith(color: RsColor.white, fontSize: 16.0, fontWeight: FontWeight.w600, ),
    titleMedium: const TextStyle().copyWith(color: RsColor.white, fontSize: 16.0, fontWeight: FontWeight.w500, ),
    titleSmall: const TextStyle().copyWith(color: RsColor.white, fontSize: 16.0, fontWeight: FontWeight.w400, ),

    /// This is body.
    bodyLarge: const TextStyle().copyWith(color: RsColor.white, fontSize: 14.0, fontWeight: FontWeight.w500, ),
    bodyMedium: const TextStyle().copyWith(color: RsColor.white, fontSize: 14.0, fontWeight: FontWeight.normal, ),
    bodySmall: const TextStyle().copyWith(color: RsColor.whiteWithOpacity, fontSize: 14.0, fontWeight: FontWeight.w500, ),

    /// This is label.
    labelLarge: const TextStyle().copyWith(color: RsColor.white, fontSize: 12.0, fontWeight: FontWeight.normal, ),
    labelMedium: const TextStyle().copyWith(color: RsColor.whiteWithOpacity, fontSize: 120, fontWeight: FontWeight.normal, ),
    labelSmall: const TextStyle().copyWith(color: RsColor.whiteWithOpacity, fontSize: 12.0, fontWeight: FontWeight.normal, ),
  );
}