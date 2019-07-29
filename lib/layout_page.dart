import 'package:flutter/material.dart';

import 'data/data.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter布局组件'),
      ),
      body: new MainLayout(),
    );
  }
}

class MainLayout extends StatelessWidget {
  const MainLayout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(5.0),
          sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            ClipWidget(),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559991315080&di=337623c0fcbd1d0c32e2726dc08f5c2e&imgtype=0&src=http%3A%2F%2Fpic.eastlady.cn%2Fuploads%2Ftp%2F201708%2F9999%2F8aa8a85f3b.jpg",
                    width: 120,
                    height: 80,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559991315080&di=337623c0fcbd1d0c32e2726dc08f5c2e&imgtype=0&src=http%3A%2F%2Fpic.eastlady.cn%2Fuploads%2Ftp%2F201708%2F9999%2F8aa8a85f3b.jpg",
                      width: 60,
                      height: 40,
                    ),
                  )
                ],
              ),
            ),
            Wrap(
              //创建一个Warp布局从左向右进行排列，会自动换行
              spacing: 8, //水平间距
              runSpacing: 5, //垂直间距
              children: <Widget>[
                chip('Flutter'),
                chip('Dart'),
                chip('Android'),
                chip('Java'),
                chip('Kotlin'),
                chip('ios'),
              ],
            ),
            Column(
              children: <Widget>[
                Text('列表'),
                Container(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new FullHeightWidget()));
                      },
                      child: Text('填充拉满高度，这里无法实现，点击跳转看实现效果')),
                )
              ],
            )
          ])),
        )
      ],
    );
  }
}

class FullHeightWidget extends StatelessWidget {
  const FullHeightWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('见识下高度拉满'),
      ),
      body: Column(
        children: <Widget>[
          Text('一个竖直列表布局'),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              child: Text('真-高度直接拉满'),
            ),
          )
        ],
      ),
    );
  }
}

class ClipWidget extends StatelessWidget {
  const ClipWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559991315080&di=337623c0fcbd1d0c32e2726dc08f5c2e&imgtype=0&src=http%3A%2F%2Fpic.eastlady.cn%2Fuploads%2Ftp%2F201708%2F9999%2F8aa8a85f3b.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(34.0)),
                child: Opacity(
                  opacity: 0.6,
                  child: Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559991315080&di=337623c0fcbd1d0c32e2726dc08f5c2e&imgtype=0&src=http%3A%2F%2Fpic.eastlady.cn%2Fuploads%2Ftp%2F201708%2F9999%2F8aa8a85f3b.jpg",
                    width: 220,
                    height: 160,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          height: 100,
          margin: EdgeInsets.all(10),
          child: PhysicalModel(
            //PhysicalModel在没有容器包裹时，界面会卡死
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(16.0),
            clipBehavior: Clip.antiAlias, //裁切抗锯齿
            child: PageView(
              children: <Widget>[
                item('page1', Colors.purple),
                item('page2', Colors.blueAccent),
                item('page3', Colors.greenAccent),
                item('page4', Colors.green),
              ],
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: Text(
              '宽度撑满',
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
