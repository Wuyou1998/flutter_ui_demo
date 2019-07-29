import 'package:flutter/material.dart';

List<String> mainList = [
  'StatelessWidget',
  'StatefulWidget',
  'FlutterLayoutPage',
  'GesturePage',
  'LaunchPage',
  'PhotoAppDemo',
  'ImageExhibitionPage',
  'AnimationPage',
  'AnimationPage2',
  'HeroAnimationPage',
  'HeroAnimationPage2',
  'FutureBuilderPage'

];

Widget item(String title, Color color) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color),
    child: Text(
      title,
      style: TextStyle(fontSize: 22, color: Colors.white),
      textAlign: TextAlign.center,
    ),
  );
}

chip(String label) {
  return Chip(
    label: Text(label),
    avatar: CircleAvatar(
      child: Text(label.substring(0,1),style: TextStyle(fontSize: 18.0,color: Colors.white),),
      backgroundColor: Colors.greenAccent.shade700,
    ),

  );
}
