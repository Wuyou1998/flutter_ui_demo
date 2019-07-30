import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String _printString = '';
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterGesturePage'),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => _printMsg('点击'),
                  onDoubleTap: () => _printMsg('双击'),
                  onLongPress: () => _printMsg('长按'),
                  onTapDown: (e) => _printMsg('按下'),
                  onTapUp: (e) => _printMsg('松开'),
                  onTapCancel: () => _printMsg('取消'),
                  child: Container(
                    margin: EdgeInsets.all(24.0),
                    padding: EdgeInsets.all(42.0),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        border: Border.all(
                            color: Colors.blue,
                            style: BorderStyle.solid,
                            width: 2)),
                    child: Text(
                      '来点一下子呀',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                ),
                Text(_printString)
              ],
            ),
            Positioned(
              //小球跟着手指滑动
              left: moveX,
              top: moveY,
              child: GestureDetector(
                onPanUpdate: (e) => _doMove(e),
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(36)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _printMsg(String s) {
    setState(() {
      _printString += ' $s,';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
    print(e);
  }
}
