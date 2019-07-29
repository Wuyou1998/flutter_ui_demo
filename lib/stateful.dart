import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_ui_demo/data/data.dart';
class FulGroupPage extends StatefulWidget {
  @override
  FulGroupPageState createState() => FulGroupPageState();
}

class FulGroupPageState extends State<FulGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "StateFulWidget组件展示",
            textAlign: TextAlign.center,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.android,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.android,
                    color: Colors.blueAccent,
                  ),
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  title: Text('我的')),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Toast.show('你点了我一下', context,
                gravity: Toast.CENTER,
                backgroundRadius: 5.0,
                backgroundColor: Colors.deepOrange);
          },
          child: Text('点我'),
        ),
        body: MainPage(
          index: _currentIndex,
        ),
      );
}

class MainPage extends StatelessWidget {
  final int index;

  MainPage({this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0)
      return Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(
                color: Colors.red,
                style: BorderStyle.solid,
                width: 4.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(24.0))),
          child: Center(
            child: Text(
              '这是首页',
            ),
          ),
        ),
      );
    if (index == 1)
      return RefreshIndicator(
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                        color: Colors.greenAccent,
                        style: BorderStyle.solid,
                        width: 4.0),
                    borderRadius: BorderRadius.all(Radius.circular(24.0))),
                child: Center(
                  child: Text(
                    '这是我的',
                  ),
                ),
              ),
            ),
            Image.network(
              'http://e.hiphotos.baidu.com/image/h%3D300/sign=a9e671b9a551f3dedcb2bf64a4eff0ec/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg',
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                hintText: '请输入',
                hintStyle: TextStyle(fontSize: 15)
              ),
            ),
            Container(height: 150,margin: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: PageView(children: <Widget>[
              item('page1',Colors.purple),
              item('page2',Colors.blueAccent),
              item('page3',Colors.greenAccent),
              item('page4',Colors.green),
            ],),),
            RaisedButton(onPressed: (){
              Toast.show('点击了RaiseButton', context,gravity: Toast.CENTER);
            },child: Text('这是个RaiseButton,是Stateless组件'),)

          ],
        ),
        onRefresh: _handleRefresh,
      );
    return null;
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return null;
  }


}
