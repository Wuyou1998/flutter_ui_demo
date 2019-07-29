import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter启动第三方应用'),
      ),
      body: new LaunchPageHome(),
    );
  }
}

class LaunchPageHome extends StatelessWidget {
  const LaunchPageHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () => _launchURL(),
            child: Text("Show Flutter HomePage"),
          ),
          RaisedButton(
            onPressed: () => _openBaidu(),
            child: Text("Show Baidu"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _openBaidu() async{
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }
}
