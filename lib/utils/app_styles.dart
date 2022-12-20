import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = const Color(0xFFeeedf2);
  static Color orangeColor = const Color(0xFFF37B67);
  static Color kakiColor = const Color(0xFFd2bdb6);
  static Color iconColor = const Color(0xFFBFC2DF);
  static Color lightBlue = const Color(0xFF3AB8B8);
  static Color lightBlueDarker = const Color(0xFF189999);
  static Color iconLightBlue = const Color(0xFF8ACCF7);
  static Color orangeDark = const Color(0xFFEC6545);
  static Color blueMarine = const Color(0xFF526799);
  static Color pink = const Color.fromRGBO(244, 159, 153, 1);

  static TextStyle textStyle =
      TextStyle(fontSize: 16.0, color: textColor, fontWeight: FontWeight.w500);

  static TextStyle headlineStyle1 =
      TextStyle(fontSize: 26.0, color: textColor, fontWeight: FontWeight.bold);

  static TextStyle headlineStyle2 =
      TextStyle(fontSize: 21.0, color: textColor, fontWeight: FontWeight.bold);

  static TextStyle headlineStyle3 =
      const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500);

  static TextStyle headlineStyle4 = TextStyle(
      fontSize: 14.0, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
}
