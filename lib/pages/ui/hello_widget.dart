import 'package:flutter/material.dart';

void main() {
  runApp(HelloWidget());
}

class HelloWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("如何构建一个布局 0-1")),
        body: Container(
          ///由于内容可能超出屏幕 所以使用listview
          child: ListView(
            children: <Widget>[
              Container(
                child:
                    Image.asset("./lib/images/icon1.jpeg", fit: BoxFit.cover),
              ),
              _textSection(),
              _buttonSection(),
              _textBottomSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _textSection() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          ///文字列
          ///文字沾满屏幕剩余空间
          Expanded(
              child: Column(
            ///文字列，居左排列
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "如何构建一个布局",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  "了解Flutter的常用Widgets之前，先了解如何构建一个布局，可以了解整个布局的构建过程，对整个布局有个体系的认知。",
                  style: TextStyle(color: Colors.grey[500]))
            ],
          )),
          FavoriteWidget(),

          ///图标
//          Icon(Icons.star, color: Colors.red),
//
//          ///文字
//          Text("17")
        ],
      ),
    );
  }

  Widget _buttonSection() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonIndex("CALL", Colors.blue, Icons.call),
          _buildButtonIndex("ROUTE", Colors.blue, Icons.near_me),
          _buildButtonIndex("SHARE", Colors.blue, Icons.share),
        ],
      ),
    );
  }

  ///构建每个按钮图标，因为每个图标布局一样，所以抽离公共方法
  Column _buildButtonIndex(String des, Color color, IconData icon) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),

        ///文字和图片的间距，因为文字本身不能设置，所以借用Container
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            des,
            style: TextStyle(color: color, fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget _textBottomSection() => Container(
        padding: EdgeInsets.all(32),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',

          ///填充列宽后自动换行
          softWrap: true,
        ),
      );
}

///星星按钮
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

///存储可变信息
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 100;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ///按钮设置边距，所以用容器包裹
        Container(
          padding: EdgeInsets.all(0),

          ///因为按钮可点击，所以用IconButton
          child: IconButton(

              ///根据状态显示不同的图标
              icon: _isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
              color: Colors.red[500],
              onPressed: () {
                _toggleFavorite();
              }),
        ),

        ///文字包裹在SizedBox中防止因为文字长度变化发生跳跃
//        Text('$_favoriteCount')
        SizedBox(
          width: 25,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }
}
