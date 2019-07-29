import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _style = TextStyle(
      fontSize: 24,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget基础组件'),
        ),
        body: new CenterWidget(style: _style));
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    Key key,
    @required TextStyle style,
  })  : _style = style,
        super(key: key);

  final TextStyle _style;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.greenAccent]),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(
              color: Colors.red, width: 2.0, style: BorderStyle.solid)),
      child: CustomScrollView(
        //ScrollView
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Text(
                '123',
                style: _style,
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.android,
                size: 48,
                color: Colors.deepOrange,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                  backgroundColor: Colors.amberAccent,
                  padding: EdgeInsets.all(16.0),
                  avatar: Icon(
                    Icons.people,
                    color: Colors.green,
                  ),
                  label: Text(
                    '我要成为Flutter大牛！',
                    style: TextStyle(color: Colors.white),
                  )),
              Card(
                color: Colors.greenAccent,
                elevation: 8.0,
                margin: EdgeInsets.all(16.0),
                child: GestureDetector(
                  //手势检测组件 ->单击，双击，长按，按下，抬起等...
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text('好好学习！'),
                  ),
                  onTap: () {
                    final snackBar = SnackBar(
                      content: Text("点击了Card一下"),
                      action: SnackBarAction(
                          label: '取消',
                          onPressed: () {
                            Toast.show('取消', context, gravity: Toast.CENTER);
                          }),
                      duration: Duration(milliseconds: 1500),
                      backgroundColor: Colors.greenAccent,
                    );
                    //snackBar的用法
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
              AlertDialog(
                title: Text('通知'),
                content: Text('我是你爸爸'),
              ),
              AboutDialog(
                applicationVersion: '1.0',
                applicationIcon: Icon(
                  Icons.android,
                  color: Colors.green,
                ),
                children: <Widget>[Text('你是个沙比')],
              ),
              Card(
                  child: ListTile(
                leading: FlutterLogo(),
                title: Text('这是一条ListTile'),
                trailing: GestureDetector(
                  child: Icon(Icons.more_vert),
                  onTap: () {
                    print('点击了一下');
                  },
                ),
              )),
            ])),
          ),
        ],
      ),
    );
  }
}
