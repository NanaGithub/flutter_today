import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(IndexStatefulWidget());
}

class IndexStatefulWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '交互、状态管理',
      home: Scaffold(
          appBar: AppBar(
            title: Text('交互、状态管理'),
          ),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "\n1、widget管理自己的状态\n",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TapboxA()
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "\n2、父widget管理widget的状态\n",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  ParentWidget()
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "\n3、混合管理状态\n",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  ParentWidget2()
                ],
              )
            ],
          )),
    );
  }
}



///混合管理
class ParentWidget2 extends StatefulWidget {
  @override
  _ParentWidget2State createState() => _ParentWidget2State();
}

class _ParentWidget2State extends State<ParentWidget2> {
  bool _active = false;

  void _handleChangeTap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxCWidget(active: _active, onChange: _handleChangeTap),
    );
  }
}

class TapboxCWidget extends StatefulWidget {
  bool active = false;
  ValueChanged<bool> onChange;

  TapboxCWidget({Key key, this.active: false, @required this.onChange});

  @override
  _TapboxCWidgetState createState() => _TapboxCWidgetState();
}

///widget处理，用户按下时 添加边框，抬起/取消则移除边框
class _TapboxCWidgetState extends State<TapboxCWidget> {
  ///通知父widget更新状态
  void _handleTap() {
    ///widget可以调用到上边的属性
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///点击事件，父widget管理状态
      onTap: _handleTap,

      ///按下抬起取消事件，widget自己处理
      onTapUp: _handleTapUp,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,

      ///UI
      child: Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
            color: widget.active ? Colors.red[200] : Colors.grey[600],

            ///根据抬起、按下、取消事件的状态来显示边框
            border: _highlight
                ? Border.all(color: Colors.deepPurpleAccent[100], width: 10)
                : null),
        child: Center(
          child: Text(widget.active ? "Active" : "非Active",
              style: TextStyle(color: Colors.white,fontSize: 18)),
        ),
      ),
    );
  }

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }
}




///父widget管理widgets的状态
///父管理状态，所以是有状态widget
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  ///真正更新状态方法
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(active: _active, onChanged: _handleTapboxChanged),
    );
  }
}

///改变状态时通知父widget
class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    ///通知父更新状态
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        ///点击事件
        onTap: _handleTap,
        child: Container(
          ///描绘一个正方形
          width: 150.0,
          height: 150.0,
          decoration:
              BoxDecoration(color: active ? Colors.red[200] : Colors.grey[600]),

          ///文字在中间
          child: Center(
            child: Text(
              active ? "Active" : "InActive",
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
        ));
  }
}




///widget管理自己的状态
class TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = true;

  void _handleTap() {
    setState(() {
      ///更新状态
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        ///点击事件
        onTap: _handleTap,
        child: Container(
          ///描绘一个正方形
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
              color: _active ? Colors.red[200] : Colors.grey[600]),

          ///文字在中间
          child: Center(
            child: Text(
              _active ? "Active" : "InActive",
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
        ));
  }
}
