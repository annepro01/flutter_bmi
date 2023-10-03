import 'package:flutter/material.dart';
import 'dart:math';
import 'components/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'inout_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dasdsemo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF161B22),
      ),
      home: MyHomePage(),
    );
  }
}

