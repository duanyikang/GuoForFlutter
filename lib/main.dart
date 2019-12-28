import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/Router.dart' as router;

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.grey[100],
    accentColor: Colors.blueAccent,
    backgroundColor: Colors.grey[100],
    scaffoldBackgroundColor: Colors.grey[100],
    canvasColor: Colors.transparent,
    textTheme: TextTheme(
      headline: TextStyle(),
      title: TextStyle(),
      body1: TextStyle(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WishR',
      theme: light,
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
