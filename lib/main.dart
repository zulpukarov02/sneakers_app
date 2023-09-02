import 'package:flutter/material.dart';
import 'package:sneakers_app/view/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneakers Shop App',
      theme: ThemeData(fontFamily: "Guicksand"),
      home: MainNavigator(),
    );
  }
}
