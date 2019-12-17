import 'package:flutter/material.dart';
import 'package:flutter_today/pages/main.dart';
import 'package:flutter_today/pages/hello/hello_flutter.dart';
import 'route/route_main.dart';

///欢迎页
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
