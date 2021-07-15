import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Page Not Found',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
