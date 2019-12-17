import 'package:flutter/material.dart';

import 'package:flutter_today/pages/hello/hello_flutter.dart';
import 'flutter_widget.dart';
import 'route/route_main.dart';
import 'ui/hello_widget.dart';
import 'ui/common_widgets.dart';
import 'route/hero.dart';
import 'ui/stateful_widget.dart';

///主页面
class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      initialRoute: "/",
      routes: {
        ///主页面声明路由表
        "/": (context) => ListWidget(),
        HelloFlutter.routeName: (context) => HelloFlutter(),
        SecondPage.routeName: (context) => SecondPage(),
      },
    );
  }
}

///列表数据
class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<String> listTitle = [
    "Hello Flutter",
    "路由和导航",
    "一个布局的构建",
    "Flutter中的布局",
    "交互和状态管理",
    "添加&移除组件",
    "转场动画"
  ];

  List<Widget> listWidget = [
    HelloFlutter(),
    RoutePage(),
    HelloWidget(),
    CommonWidgets(),
    IndexStatefulWidget(),
    WidgetPage(),
    MainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("今天Flutter"),
      ),
      body: new ListView.builder(
          itemCount: listTitle.length,
          itemBuilder: (BuildContext context, int position) {
            return _getRow(position);
          }),
    );
  }

  Widget _getRow(int pos) {
    return new GestureDetector(
      child: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: Text(listTitle[pos], style: TextStyle(fontSize: 18)),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => listWidget[pos]));
      },
    );
  }
}
