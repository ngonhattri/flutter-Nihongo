import 'package:flutter/material.dart';
import 'package:dacn/dict/pages/search_page.dart';

class Dict extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}


