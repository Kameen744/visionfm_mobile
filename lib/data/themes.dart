import 'package:flutter/material.dart';
import 'package:visionfm/data/colors.dart';

class Themes {
  static List<ThemeData> themeList = [
    ThemeData(
      primaryColor: primary,
      accentColor: primary,
      textTheme: TextTheme(bodyText2: TextStyle(color: visionWhite)),
    ),
    ThemeData.dark().copyWith(),
  ];
}
