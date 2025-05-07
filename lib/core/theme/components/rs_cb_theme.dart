import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class RsCbTheme{
  RsCbTheme._();

  // Light Theme.
  static CheckboxThemeData RideShareLightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    checkColor: MaterialStateProperty.resolveWith((state){
      if(state.contains(MaterialState.selected)){
        return RsColor.white;
      }else{
        return RsColor.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((state){
      if(state.contains(MaterialState.selected)){
        return RsColor.primaryFirst;
      }else{
        return RsColor.trans;
      }
    })
  );

  // Dark Theme.
  static CheckboxThemeData RideShareDarkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    checkColor: MaterialStateProperty.resolveWith((state){
      if(state.contains(MaterialState.selected)){
        return RsColor.white;
      }else{
        return RsColor.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((state){
      if(state.contains(MaterialState.selected)){
        return RsColor.primaryFirst;
      }else{
        return RsColor.trans;
      }
    })
  );
}