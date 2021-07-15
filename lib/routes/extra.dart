import 'package:flutter/material.dart';
import 'package:visionfm/data/colors.dart';

class Extra {
  //rounded button style
  static ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  // vision album art box decoration
  static BoxDecoration albumBoxDecoration() {
    return BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.center,
        colors: [Colors.grey[700], primary],
      ),
      boxShadow: [
        BoxShadow(
          color: visionDark.withOpacity(0.4),
          offset: Offset(2, 3),
          spreadRadius: 20,
          blurRadius: 80,
        ),
        BoxShadow(
          color: visionWhite,
          offset: Offset(-3, -3),
          spreadRadius: 4,
          blurRadius: 10,
        ),
      ],
    );
  }
}
