import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(RowAndColumnDemo());
}

///Row和Column Demo,小bug
class RowAndColumnDemo extends StatelessWidget {
  ///星星组件
  static final stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.black),
      Icon(Icons.star, color: Colors.black),
    ],
  );

  ///评星布局
  ///注意：申明变量时，必须带有返回值
  static final ratings = Container(
    padding: EdgeInsets.all(20),
    child: Row(
      children: <Widget>[
        stars,
        Text("170 stars",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                fontSize: 20))
      ],
    ),
  );

  ///底部，文字style
  static final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2);

  ///底部布局
  static final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),

        ///一行三列
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.timer, color: Colors.green[500]),
                Text("Android"),
                Text("3年")
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.timer, color: Colors.green[200]),
                Text("Java"),
                Text("1年")
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.timer, color: Colors.green[200]),
                Text("Flutter"),
                Text("1月")
              ],
            ),
          ],
        ),
      ));

  final leftRoot = Container(
    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
    child: Column(
      children: <Widget>[Text("标题"), Text("详情"), ratings, iconList],
    ),
  );

  final mainImage = Image.asset(
    './lib/images/pic1.png',
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Row And Column",
      home: Scaffold(
          floatingActionButton: new FloatingActionButton(onPressed: () {
//
//            Navigator.of(context).push(context,
//                MaterialPageRoute(builder: (context) => RowAndColumnPage()));
          },child: Text("测试"),),
          appBar: AppBar(title: Text("嵌套行列（Row、Column）")),
          body: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ///左侧
                    Container(
                      width: 240,
                      height: 320,
                      child: leftRoot,
                    ),
                    mainImage

                    ///右侧
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

///Row和Column测试
class RowAndColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Row"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("\nExpanded：图片自适应屏幕，属性flex：设置占比\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ///Expanded 包裹图片，可以使图片自适应屏幕，而不至于太宽或者太高而超出屏幕
                  Expanded(child: Image.asset("./lib/images/icon1.jpeg")),
                  Expanded(
                    ///所占比重，整数倍，默认1
                    flex: 2,
                    child: Image.asset("./lib/images/icon1.jpeg"),
                  ),
                  Expanded(
                    child: Image.asset("./lib/images/icon1.jpeg"),
                    flex: 3,
                  ),
                ],
              ),
              Text("\n【MainAxisAlignment.spaceEvenly】\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("./lib/images/pic1.png"),
                  Image.asset("./lib/images/pic2.png"),
                  Image.asset("./lib/images/pic3.png"),
                ],
              ),
              Text("\n【MainAxisAlignment.spaceAround】\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset("./lib/images/pic1.png"),
                  Image.asset("./lib/images/pic2.png"),
                  Image.asset("./lib/images/pic3.png"),
                ],
              ),
              Row(
                ///当设置最大时，默认从左开始排列,设置最小时，自己居中排列
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.red[100]),
                  Icon(Icons.star, color: Colors.grey),
                  Icon(Icons.star, color: Colors.green),
                  Icon(Icons.star, color: Colors.yellow[500]),
                  Icon(Icons.star, color: Colors.red),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
