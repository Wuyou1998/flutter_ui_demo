import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/http_test.dart';
import 'package:flutter_ui_demo/stateful.dart';
import 'package:flutter_ui_demo/stateless.dart';

import 'HeroAnimationPage2.dart';
import 'animationPage.dart';
import 'animationPage2.dart';
import 'data/data.dart';
import 'gesturePage.dart';
import 'heroAnimatiomPage.dart';
import 'imageExhibitionPage.dart';
import 'launchPage.dart';
import 'layout_page.dart';
import 'list_page.dart';
import 'photoAppDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness _brightness = Brightness.light;
  String _themeName='Theme.light';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Flutter Demo',
          )),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (_brightness == Brightness.dark){
                    _brightness = Brightness.light;
                    _themeName='Theme.light';
                  }
                  else{
                    _brightness = Brightness.dark;
                    _themeName='Theme.dark';
                  }
                });
              },
              child: Text(_themeName),
            ),
            Expanded(child: MyList()),
          ],
        ),
      ),
      routes: {
        'LessGroupPage': (context) => LessGroupPage(),
        'FulGroupPage': (context) => FulGroupPage(),
        'FlutterLayoutPage': (context) => FlutterLayoutPage(),
        'GesturePage': (context) => GesturePage(),
        'LaunchPage': (context) => LaunchPage(),
        'PhotoAppDemo': (context) => PhotoAppDemo(),
        'ImageExhibitionPage': (context) => ImageExhibitionPage(),
        'AnimationPage': (context) => AnimationPage(),
        'AnimationPage2': (context) => AnimationPage2(),
        'HeroAnimationPage': (context) => HeroAnimationPage(),
        'HeroAnimationPage2': (context) => HeroAnimationPage2(),
        'FutureBuilderPage': (context) => HttpPage(),
        'ListPage': (context) => ListPage(),
      },
    );
  }
}

class MyList extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);
  final TextAlign _textAlign = TextAlign.center;

  build(BuildContext context) => ListView.builder(
      itemCount: mainList.length,
      itemBuilder: (context, index) {
        final item = mainList[index];
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(
                item,
                style: _textStyle,
                textAlign: _textAlign,
              ),
              dense: true,
              onTap: () => _switchToPage(index, context),
            ),
            Divider(
              indent: 10, //左侧间距
              height: 1.0, //容器高度，不是线的高度
              color: Colors.black,
            ),
            //Divider控件只有左侧间距，并不完美，划线还是用高度为1的Container吧
//            Container(
//              margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
//              width: double.infinity,
//              height: 2.0,
//              color: Colors.black,
//            )
          ],
        );
      });

  void _switchToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, 'LessGroupPage');
        break;
      case 1:
        Navigator.pushNamed(context, 'FulGroupPage');
        break;
      case 2:
        Navigator.pushNamed(context, 'FlutterLayoutPage');
        break;
      case 3:
        Navigator.pushNamed(context, 'GesturePage');
        break;
      case 4:
        Navigator.pushNamed(context, 'LaunchPage');
        break;
      case 5:
        Navigator.pushNamed(context, 'PhotoAppDemo');
        break;
      case 6:
        Navigator.pushNamed(context, 'ImageExhibitionPage');
        break;
      case 7:
        Navigator.pushNamed(context, 'AnimationPage');
        break;
      case 8:
        Navigator.pushNamed(context, 'AnimationPage2');
        break;
      case 9:
        Navigator.pushNamed(context, 'HeroAnimationPage');
        break;
      case 10:
        Navigator.pushNamed(context, 'HeroAnimationPage2');
        break;
      case 11:
        Navigator.pushNamed(context, 'FutureBuilderPage');
        break;
      case 12:
        Navigator.pushNamed(context, 'ListPage');
        break;
    }
  }
}
