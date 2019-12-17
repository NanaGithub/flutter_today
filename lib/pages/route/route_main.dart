import 'package:flutter/material.dart';
import 'route_tow.dart';
import 'todo.dart';

///路由测试
class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("启动路由Page"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("1、简单启动方式一："),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '1、直接调用Page启动。方法：Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPage()))；'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, SecondPage.routeName);
              },
              child: Text("2、简单启动方式二"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '2、在主页main方法中声明路由表，通过路由名称启动。方法：Navigator.pushNamed(context, SecondPage.routeName)'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExtractArgumentsPage(),
                        settings: RouteSettings(
                            arguments: ScreenArguments(
                                "获取携带参数的Page", "携带参数6不6，就是写法hi繁琐呀"))));
              },
              child: Text("3、携参启动"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '3、携带参数启动。 Navigator.push(context,MaterialPageRoute(builder: (context) => ExtractArgumentsPage(),settings: RouteSettings(arguments: ScreenArguments("获取携带参数的Page", "携带参数6不6，就是写法hi繁琐呀"))))'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RouteTowPage()));
              },
              child: Text("4、带有返回值的启动"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoPage()));
              },
              child: Text("5、Todo Demo"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  static final routeName = '/second';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("一个新的Page"),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("回到第一页"),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

///携带参数的跳转
class ExtractArgumentsPage extends StatelessWidget {
  static final routeName = "/extract";

  @override
  Widget build(BuildContext context) {
    ///获取获取携带的参数
    final ScreenArguments arguments = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
        appBar: AppBar(
          title: Text(arguments.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("「获取携带参数方法」：ModalRoute.of(context).settings.arguments"),
            Text("参数值：" + arguments.message),
          ],
        ));
  }
}
