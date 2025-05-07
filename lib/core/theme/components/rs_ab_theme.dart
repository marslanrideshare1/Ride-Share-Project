import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class RsAbTheme{
  RsAbTheme._();


  // Light Theme.
 static get RideShareLightAppBarTheme => AppBarTheme(
   elevation: 0.0,
   centerTitle: false,
   scrolledUnderElevation: 0.0,
   backgroundColor: RsColor.trans,
   surfaceTintColor: RsColor.trans,
   iconTheme: IconThemeData(color: RsColor.black, size: 24),
   actionsIconTheme: IconThemeData(color: RsColor.black, size: 24),
   titleTextStyle: TextStyle(color: RsColor.black, fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: "")
 );

 // Dark Theme.
 static get RideShareDarkAppBarTheme => AppBarTheme(
   elevation: 0.0,
   centerTitle: false,
   scrolledUnderElevation: 0.0,
   backgroundColor: RsColor.trans,
   surfaceTintColor: RsColor.trans,
   iconTheme: IconThemeData(color: RsColor.black, size: 24),
   actionsIconTheme: IconThemeData(color: RsColor.white, size: 24),
   titleTextStyle: TextStyle(color: RsColor.white, fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: "")
 );
}