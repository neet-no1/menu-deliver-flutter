// @dart=2.9

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter/slick.dart';
import 'package:sample_flutter/top.dart';

import 'basic.dart';
import 'menu_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      initialRoute: '/',
      routes: {
        '/': (context) => const BasicWidget(TopWidget()),
        '/menu_view': (context) => const BasicWidget(MenuView()),
      },
    );
  }
}
