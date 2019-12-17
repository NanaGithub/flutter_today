import 'package:flutter/material.dart';

//void main() => runApp(MyApp());
///Flutter中移除和添加组件
class WidgetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "测试",
      home: new SamplePage(),
    );
  }

  WidgetPage();

}

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  //开关
  bool toggle = true;

  void _toggle() {
    //必须调用setState来更改状态
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getView() {
    if (toggle) {
//      return new AssetImage("images/wechat.png");
      return new Text("这是一个Text");
    } else {
      return new MaterialButton(
        onPressed: () {},
        child: new Text("这是一个MaterialButton"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter中移除和添加组件"),
      ),
      body: new Center(
        //子view的添加和移除，根据状态来判断
        child: _getView(),
      ),
      floatingActionButton: new FloatingActionButton(
        //点击，切换状态
        onPressed: _toggle,
        tooltip: "Updte View",
        child: new Icon(Icons.update),
      ),
    );
  }
}
