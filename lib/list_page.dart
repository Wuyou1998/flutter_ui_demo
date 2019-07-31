import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

const CITY_NAMES = ['北京', '上海', '深圳', '天津', '成都', '四川', '西安', '武汉'];
const CITY_NAMES_2 = {
  '北京': [
    '北京',
    '北京',
  ],
  '上海': [
    '上海',
    '上海',
  ],
  '深圳': [
    '深圳',
    '深圳',
  ],
  '天津': [
    '天津',
    '天津',
  ],
  '成都': [
    '成都',
    '成都',
  ],
  '四川': [
    '四川',
    '四川',
  ],
  '西安': [
    '西安',
    '西安',
  ],
  '武汉': [
    '武汉',
    '武汉',
  ],
};

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView相关'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerticalListPage()));
                },
                child: Text('竖直ListView'),
              ),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HorizontalListPage()));
                },
                child: Text('横向ListView'),
              ),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandListPage()));
                },
                child: Text('可展开ListView'),
              ),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GridViewPage()));
                },
                child: Text('GridView'),
              ),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RefreshAndLoadPAge()));
                },
                child: Text('上拉刷新下拉加载'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('竖直列表'),
      ),
      body: ListView(
        children: _buildList(context),
      ),
    );
  }
}

class HorizontalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('水平列表'),
      ),
      body: Container(
        height: 60,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: _buildList(context),
        ),
      ),
    );
  }
}

List<Widget> _buildList(BuildContext context) {
  return CITY_NAMES.map((city) => _item(city, context)).toList();
}

Widget _item(String city, context) {
  return Card(
      child: Container(
    height: 60,
    width: 300,
    child: ListTile(
      leading: FlutterLogo(),
      title: Text(city),
      trailing: GestureDetector(
        child: Icon(Icons.more_vert),
        onTap: () {
          Toast.show(city, context, gravity: Toast.CENTER);
        },
      ),
    ),
  ));
}

class ExpandListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可展开列表'),
      ),
      body: Container(
        child: ListView(
          children: _buildList_2(context),
        ),
      ),
    );
  }
}

List<Widget> _buildList_2(BuildContext context) {
  List<Widget> widgets = [];
  CITY_NAMES_2.keys.forEach((key) {
    widgets.add(_item_2(key, CITY_NAMES_2[key]));
  });
  return widgets;
}

Widget _item_2(String key, List<String> subCities) {
  return ExpansionTile(
    title: Text(
      key,
      style: TextStyle(fontSize: 24, color: Colors.black87),
    ),
    children: subCities.map((subCity) => _buildSub(subCity)).toList(),
  );
}

Widget _buildSub(String subCity) {
  return FractionallySizedBox(
    widthFactor: 1,
    child: Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Card(
          child: ListTile(
        leading: FlutterLogo(),
        title: Text(subCity),
        trailing: GestureDetector(
          child: Icon(Icons.more_vert),
          onTap: () {},
        ),
      )),
    ),
  );
}

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView网格布局"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _buildList(context),
      ),
    );
  }
}

class RefreshAndLoadPAge extends StatefulWidget {
  @override
  _RefreshAndLoadPAgeState createState() => _RefreshAndLoadPAgeState();
}

class _RefreshAndLoadPAgeState extends State<RefreshAndLoadPAge> {
  List<String> cities = ['北京', '上海', '深圳', '天津', '成都', '四川', '西安', '武汉','广州','南京','杭州','合肥','毕节'];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上拉刷新下拉加载'),
      ),
      body: RefreshIndicator(
          onRefresh: _handRefresh,
          color: Colors.amber,
          child: ListView(
            controller: _controller,
            children: _buildList(context),
          )),
    );
  }

  List<Widget> _buildList(BuildContext context) {
    return cities.map((city) => _item(city, context)).toList();
  }

  Widget _item(String city, context) {
    return Card(
        child: Container(
      height: 60,
      width: 300,
      child: ListTile(
        leading: FlutterLogo(),
        title: Text(city),
        trailing: GestureDetector(
          child: Icon(Icons.more_vert),
          onTap: () {
            Toast.show(city, context, gravity: Toast.CENTER);
          },
        ),
      ),
    ));
  }

  Future<Null> _handRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cities = cities.reversed.toList();
    });
    return null;
  }

  _loadData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      List<String> list = List<String>.from(CITY_NAMES);
      cities.addAll(list);
    });
  }
}
