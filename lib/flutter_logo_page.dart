import 'package:flutter/material.dart';

class FlutterLogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 256,
          style: FlutterLogoStyle.stacked,
        ),
      ),
    );
  }
}
