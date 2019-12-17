import 'package:flutter/material.dart';

//void main() {
//  runApp(CommonWidgets());
//}

class CommonWidgets extends StatelessWidget {
  final List<String> listTitle = [
    "Card（卡片3D效果）",
    "Stack（类似Framlayout）",
    "ListView",
    "GridView",
    "Container",
    "Material App",
    "非Material App"
  ];

  final List<Widget> listWidget = [
    CardTest(),
    StackTest(),
    ListViewTest(),
    GridViewTest(),
    ContainerTest(),
    MaterialAppTest(),
    NormalAppTest()
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("常用的Widgets"),
          ),
          body: ListView.builder(
            itemCount: listWidget.length,
            itemBuilder: (BuildContext context, int pos) {
              return Container(
                padding: EdgeInsets.only(top: 10,left: 32,right: 32),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return listWidget[pos];
                    }));
                  },
                  child: Text(listTitle[pos]),
                ),
              );
            },
          )),
    );
  }
}

class CardTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Card(具有3D效果)"),
        ),
        body: _buildCard(),
      ),
    );
  }

  Widget _buildCard() => SizedBox(
        height: 260,
        child: Card(
          ///3D效果
          elevation: 18.0,

          ///颜色
          color: Colors.white,

          ///边距
          margin: EdgeInsets.all(20),

          ///子布局
          child: Column(
            children: <Widget>[
              ///每个子项
              ListTile(
                title: Text(
                  "姓名",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text("贾小呆"),
                leading: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text(
                  "职位",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text("为梦想而生的程序员"),
                leading: Icon(Icons.android),
              ),
              ListTile(
                title: Text(
                  "联系我",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text("1076871350"),
                leading: Icon(Icons.add_call),
              ),
            ],
          ),
        ),
      );
}

class StackTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack(类似Framlayout)"),
        ),
        body: Stack(
          ///0,0 表示居中
          alignment: Alignment(0, 0.6),
          children: <Widget>[
            ///第一个布局，作为基础布局
            CircleAvatar(
              backgroundImage: AssetImage("./lib/images/icon1.jpeg"),
              radius: 100,
            ),

            ///第二个布局，叠加在第一个布局上边
            Container(
              decoration: BoxDecoration(color: Colors.red[200]),
              child: Text("这是电影燃烧🔥",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: <Widget>[
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
        _buildTitle("Android", "特别好", Icons.title),
      ],
    );
  }

  ListTile _buildTitle(String title, String subTitle, IconData iconData) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(iconData, color: Colors.red[300]),
      onTap: () {},
    );
  }
}

class GridViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CridView"),
        ),
        body: _buildGrid(),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.extent(
      ///指定单元格最大宽度，宽度影响一行展示几个
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.all(5),

      ///主轴方向 子item空隙，也就是垂直方向的间距
      mainAxisSpacing: 4,

      ///副轴方向间距，横向
      crossAxisSpacing: 10,
      children: _buildGridTitleList(30),
    );
  }

  ///生成子item
  List<Container> _buildGridTitleList(int count) {
    return List.generate(
        count, (i) => Container(child: Image.asset("./lib/images/icon1.jpeg")));
  }
}

class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: _buildImageColumn(),
      ),
    );
  }

  ///每列是一行
  Widget _buildImageRow(int i) => Row(
        children: <Widget>[
          _buildDecoratedImage(i),
          _buildDecoratedImage(i + 1),
        ],
      );

  ///构建两列
  Widget _buildImageColumn() {
    return Container(

        ///设置整个列区域的颜色
        decoration: BoxDecoration(color: Colors.white12),
        child: Column(
          children: <Widget>[_buildImageRow(1), _buildImageRow(3)],
        ));
  }

  ///构建每个图片
  _buildDecoratedImage(int i) => Container(
        ///每个图片外饰
        decoration: BoxDecoration(

            ///边框大小颜色
            border: Border.all(width: 8, color: Colors.black26),

            ///边框角度
            borderRadius: const BorderRadius.all(Radius.circular(10))),

        ///每个图片外边距
        margin: EdgeInsets.all(10),
        child: Image.asset('./lib/images/pic$i.png'),
      );
}

///material app
class MaterialAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///标题
      title: "material app风格",

      ///对于Material app，可以使用Scaffold，提供了丰富的widgets
      home: Scaffold(
        appBar: AppBar(
          title: Text("这是Material风格的app"),
        ),

        ///3、把布局添加到页面中
        ///2、把可见widget添加到布局中
        body: Center(
          ///1、创建一个可见widget
          child: RaisedButton(
            onPressed: () {},
            child: Text("点击按钮"),
          ),
        ),
      ),
    );
  }
}

///非Material app，不包含appbar、标题、背景颜色
class NormalAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          "这是内容",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 32, color: Colors.black54),
        ),
      ),
    );
  }
}

///主界面
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      ///垂直线性布局
      child: Column(
        children: <Widget>[
          ///app bar
          MyAppBar(title: Text("app bar")),

          ///内容
          Expanded(
              child: Center(
            child: Text("这是内容"),
          ))
        ],
      ),
    );
  }
}

///一个通用的app bar
class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      ///高56px
      height: 56.0,

      ///padding左右8px
      padding: EdgeInsets.symmetric(horizontal: 8.0),

      ///背景颜色blue
      decoration: BoxDecoration(color: Colors.blue[500]),

      ///子widgets横向排列
      child: Row(
        children: <Widget>[
          ///左边：一个menu button
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
            tooltip: 'Navigation menu',
          ),

          ///中间
          Expanded(child: title),

          ///右边
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
            tooltip: 'Search',
          )
        ],
      ),
    );
  }
}
