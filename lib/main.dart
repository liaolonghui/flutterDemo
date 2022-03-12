// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import './pages/index/index.dart';
import './pages/edit/edit.dart'; // 编辑页

void main(List<String> args) {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // 默认'/'
      onGenerateRoute: onGenerateRoute,
    );
  }
}

// onGenerateRoute
Route onGenerateRoute (RouteSettings settings) {
  String routeName = settings.name ?? '/';

  // Check permissions
  switch (routeName) {
    case "/":
      return MaterialPageRoute(builder: (context) {
        return IndexPage();
      });
    case "/edit":
      return MaterialPageRoute(builder: (context) {
        return EditPage(arguments: settings.arguments); // 有参数
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
            body: Center(
          child: Text("Page not found"),
        ));
      });
  }
}