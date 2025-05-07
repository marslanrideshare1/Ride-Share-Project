import 'package:flutter/material.dart';

class RsColor {
  static Color custom(String c) {
    final int color = int.parse('0xFF$c');
    return Color(color);
  }

  static Color trans = Colors.transparent;
  static Color white = Colors.white;
  static Color whiteWithOpacity = const Color(0x80FFFFFF);
  static Color black = Colors.black;
  static Color blackWithOpacity = const Color(0x80000000);
  static Color primaryFirst = const Color(0xff16978A);
  static Color primarySecond = const Color(0xff1EFBFA);
  static Color primaryThird = const Color(0xff00F798);
  static Color gradiant1 = const Color(0xff00A4FB);
  static Color gradiant2 = const Color(0xff00F798);
  static Color blackBold = const Color(0xff1E232C);
  static Color grey = const Color(0xff8391A1);
  static Color greySecond = const Color(0xffD9D9D9);
  static Color greyThird = const Color(0xffE6E9EC);
  static Color border = const Color(0xffE8ECF4);
  static Color redMain = const Color(0xffCB0031);

  /// Extra
  static Color lightWhite = const Color(0xffF6F9FA);
  static Color darkBlue = const Color(0xff004677);
  static Color lightSky = const Color(0xff4CBEDC);
  static Color darkBlue2 = const Color(0xff344652);
  static Color darkGrey = const Color(0xff909CA0);
  static Color green = const Color(0xff35A933);
  static Color back = const Color(0xffF7F8F9);

  ///
  static Color red_grd_1 = const Color(0xffF63434);
  static Color red_grd_2 = const Color(0xffF96D6D);
  static Color darkRed = const Color(0xffC81D25);
  static Color blackIcon = const Color(0xff200E32);
  static Color lightBlue = const Color(0xff313E7C);
  static Color arrowBold = const Color(0xff2E3680);
  static Color blueMedium = const Color(0xff313E7C);
  static Color blueLight = const Color(0xff525DC1);
  static Color blueBold = const Color(0xff2D3342);
  static Color lightGrey = const Color(0xffCFD1D1);
  static Color greyBorder = const Color(0xffC9C9CA);
  static Color greyDarkBorder = const Color(0xff575B66);
  static Color greyIcon = const Color(0xff56565D);
  static Color greyText = const Color(0xff75788D);
  static Color greyText2 = const Color(0xff56565D);
  static Color greyBorderIcon = const Color(0xffF0F0F0);
  static Color backWhite = const Color(0xffF8F9FC);
  static Color starYellow = const Color(0xffFCC520);
  static Color borderBlack = const Color(0xff49454F);
}
