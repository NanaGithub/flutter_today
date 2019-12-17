import 'package:flutter/material.dart';

class RouteTowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('带有返回值的启动Test'),
      ),
      // Create the SelectionButton widget in the next step.
      body: Center(child: SelectionReturnPage()),
    );
  }
}

///主页面
class SelectionReturnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplayResult(context);
      },
      child: Text("点击去选择页面，并带回选择结果"),
    );
  }

  _navigateAndDisplayResult(BuildContext context) async {
    ///启动页面，并等待返回值
    final resultData = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectionPage()));

    ///吐司显示返回值
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$resultData")));
  }
}

///选择页面
class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("点击任意按钮，回到主页，并回传选择"),

            ///按钮1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  ///关闭当前页面，回到主页面，携带回传值Yes
                  Navigator.pop(context, "Yes");
                },
                child: Text("Yes!"),
              ),
            ),

            ///按钮2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  ///关闭当前页面，回到主页面，携带回传值No
                  Navigator.pop(context, "No");
                },
                child: Text("No!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
