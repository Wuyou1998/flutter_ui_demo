import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation动画组件'),
      ),
      body: new LogoAnimationWidget(),
    );
  }
}

class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class LogoAnimationWidget extends StatefulWidget {
  @override
  _LogoAnimationWidgetState createState() => _LogoAnimationWidgetState();
}

class _LogoAnimationWidgetState extends State<LogoAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

//  AnimationStatus animationStatus;
//  double animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
//      ..addListener(() {
//        setState(() {
//          animationValue = animation.value;
//        });
//      })
//      ..addStatusListener((AnimationStatus state) {
//        setState(() {
//          animationStatus = state;
//        });
//      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Center(
        child: AnimationLogo(
          animation: animation,
        ),
//        child: Column(
//          children: <Widget>[
//            GestureDetector(
//              onTap: () {
//                controller.reset();
//                controller.forward();
//              },
//              child: Text('Start',
//                  textDirection: TextDirection.ltr,
//                  style: TextStyle(fontSize: 24)),
//            ),
//            Text(
//              'State:' + animationStatus.toString(),
//              textDirection: TextDirection.ltr,
//              style: TextStyle(fontSize: 24),
//            ),
//            Text('Value:' + animationValue.toString(),
//                textDirection: TextDirection.ltr,
//                style: TextStyle(fontSize: 24)),
//            Container(
//              width: animationValue,
//              height: animationValue,
//              child: FlutterLogo(),
//            )
//          ],
//        ),
      ),
    );
  }
}
