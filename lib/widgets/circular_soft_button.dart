import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visionfm/data/colors.dart';

// ignore: must_be_immutable
class CircularSoftButton extends StatelessWidget {
  double radius;
  Color color;

  final Widget icon;
  CircularSoftButton({Key key, this.radius, this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: visionGrey,
                offset: Offset(3, 3),
                blurRadius: 10,
                spreadRadius: 4,
              ),
              BoxShadow(
                color: visionWhite,
                offset: Offset(-4, -4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
            color: color,
          ),
        ),
        Positioned.fill(child: icon),
      ],
    );
  }
}
