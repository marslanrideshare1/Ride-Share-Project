// import 'package:flutter/material.dart';
// import 'package:ride_share/core/theme/components/rs_ab_theme.dart';
// import 'package:ride_share/core/theme/components/rs_bs_theme.dart';
// import 'package:ride_share/core/theme/components/rs_cb_theme.dart';
// import 'package:ride_share/core/theme/components/rs_eb_theme.dart';
// import 'package:ride_share/core/theme/components/rs_text_theme.dart';
// import 'components/rs_color.dart';
//
// class RsTheme{
//   RsTheme._(); // This is loaded in RAM once. It is single ton class.
//
//   // This Light Theme.
//   static ThemeData rideShareLightTheme = ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       fontFamily: "UberMove",
//       scaffoldBackgroundColor: RsColor.white,
//       primaryColor: RsColor.primaryFirst,
//       textTheme: RsTextTheme.rideShareLightTextTheme,
//       elevatedButtonTheme: RsEbTheme.RideShareLightElevatedButtonTheme,
//       appBarTheme: RsAbTheme.RideShareLightAppBarTheme,
//       bottomSheetTheme: RsBsTheme.RideShareLightBottomSheetTheme,
//       checkboxTheme: RsCbTheme.RideShareLightCheckBoxTheme,
//       colorScheme: ColorScheme(
//           brightness: Brightness.light,
//           primary: ,
//           onPrimary: ,
//           secondary: ,
//           onSecondary: onSecondary,
//           error: error,
//           onError: onError,
//           surface: surface,
//           onSurface: onSurface,
//       ),
//       cardTheme: CardTheme(
//         color: Colors.purple,
//
//       ),
//
//
//
//
//   );
//
//   // This Dark Theme.
//   static ThemeData rideShareDarkTheme = ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     fontFamily: "UberMove",
//     scaffoldBackgroundColor: RsColor.black,
//     primaryColor: RsColor.primaryFirst,
//     textTheme: RsTextTheme.rideShareDarkTextTheme,
//     elevatedButtonTheme: RsEbTheme.RideShareDarkElevatedButtonTheme,
//     appBarTheme: RsAbTheme.RideShareDarkAppBarTheme,
//     bottomSheetTheme: RsBsTheme.RideShareDarkBottomSheetTheme,
//     checkboxTheme: RsCbTheme.RideShareDarkCheckBoxTheme,
//
//
//
//   );
// }

import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_ab_theme.dart';
import 'package:ride_share/core/theme/components/rs_bs_theme.dart';
import 'package:ride_share/core/theme/components/rs_cb_theme.dart';
import 'package:ride_share/core/theme/components/rs_eb_theme.dart';
import 'package:ride_share/core/theme/components/rs_text_theme.dart';
import 'components/rs_color.dart';

class RsTheme {
  RsTheme._(); // This is loaded in RAM once. It is single ton class.

  // Light Theme
  static ThemeData rideShareLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "UberMove",
    scaffoldBackgroundColor: RsColor.white,
    cardColor: RsColor.black,
    primaryColor: RsColor.primaryFirst,
    textTheme: RsTextTheme.rideShareLightTextTheme,
    elevatedButtonTheme: RsEbTheme.RideShareLightElevatedButtonTheme,
    appBarTheme: RsAbTheme.RideShareLightAppBarTheme,
    bottomSheetTheme: RsBsTheme.RideShareLightBottomSheetTheme,
    checkboxTheme: RsCbTheme.RideShareLightCheckBoxTheme,
    colorScheme: ColorScheme.light(
      primary: RsColor.primaryFirst,
      onPrimary: RsColor.black,
      primaryContainer: RsColor.primarySecond,
      secondary: RsColor.primaryThird,
      onSecondary: RsColor.white,
      error: RsColor.redMain,
      onError: RsColor.white,
      background: RsColor.backWhite,
      onBackground: RsColor.blackBold,
      surface: RsColor.white,
      onSurface: RsColor.blackBold,
      surfaceVariant: RsColor.greyThird,
    ),
    cardTheme: CardTheme(
      color: RsColor.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: RsColor.border, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),
    dividerTheme: DividerThemeData(
      color: RsColor.greySecond,
      thickness: 1,
      space: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: RsColor.lightWhite,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.primaryFirst),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.redMain),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    iconTheme: IconThemeData(
      color: RsColor.blackIcon,
      size: 24,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: RsColor.primaryFirst,
      foregroundColor: RsColor.white,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: RsColor.greyThird,
      disabledColor: RsColor.grey,
      selectedColor: RsColor.primaryFirst,
      secondarySelectedColor: RsColor.primarySecond,
      labelStyle: TextStyle(color: RsColor.blackBold),
      secondaryLabelStyle: TextStyle(color: RsColor.white),
      brightness: Brightness.light,
      padding: EdgeInsets.symmetric(horizontal: 12),
      elevation: 0,
      shape: StadiumBorder(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: RsColor.white,
      selectedItemColor: RsColor.primaryFirst,
      unselectedItemColor: RsColor.grey,
      elevation: 2,
    ),
  );

  // Dark Theme
  static ThemeData rideShareDarkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: "UberMove",
    scaffoldBackgroundColor: RsColor.black,
    primaryColor: RsColor.primaryFirst,
    cardColor: RsColor.blackWithOpacity,
    textTheme: RsTextTheme.rideShareDarkTextTheme,
    elevatedButtonTheme: RsEbTheme.RideShareDarkElevatedButtonTheme,
    appBarTheme: RsAbTheme.RideShareDarkAppBarTheme,
    bottomSheetTheme: RsBsTheme.RideShareDarkBottomSheetTheme,
    checkboxTheme: RsCbTheme.RideShareDarkCheckBoxTheme,
    colorScheme: ColorScheme.dark(
      primary: RsColor.primaryFirst,
      onPrimary: RsColor.white,
      primaryContainer: RsColor.primarySecond,
      secondary: RsColor.primaryThird,
      onSecondary: RsColor.white,
      error: RsColor.redMain,
      onError: RsColor.white,
      background: RsColor.blackBold,
      onBackground: RsColor.white,
      surface: RsColor.darkBlue2,
      onSurface: RsColor.white,
      surfaceVariant: RsColor.greyDarkBorder,
    ),
    cardTheme: CardTheme(
      color: RsColor.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: RsColor.greyDarkBorder, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),
    dividerTheme: DividerThemeData(
      color: RsColor.greyDarkBorder,
      thickness: 1,
      space: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: RsColor.blueBold,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.greyDarkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.greyDarkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.primaryFirst),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: RsColor.redMain),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    iconTheme: IconThemeData(
      color: RsColor.white,
      size: 24,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: RsColor.primaryFirst,
      foregroundColor: RsColor.black,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: RsColor.blueBold,
      disabledColor: RsColor.greyDarkBorder,
      selectedColor: RsColor.primaryFirst,
      secondarySelectedColor: RsColor.primarySecond,
      labelStyle: TextStyle(color: RsColor.white),
      secondaryLabelStyle: TextStyle(color: RsColor.black),
      brightness: Brightness.dark,
      padding: EdgeInsets.symmetric(horizontal: 12),
      elevation: 0,
      shape: StadiumBorder(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: RsColor.darkBlue2,
      selectedItemColor: RsColor.primaryFirst,
      unselectedItemColor: RsColor.grey,
      elevation: 2,
    ),
  );
}