import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class RsBsTheme{
  RsBsTheme._();

  // Light Theme.
  static BottomSheetThemeData RideShareLightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: RsColor.white,
    modalBackgroundColor: RsColor.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );


  // Dark Theme.
  static BottomSheetThemeData RideShareDarkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: RsColor.black,
      modalBackgroundColor: RsColor.black,
      constraints: BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );

}