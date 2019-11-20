import 'package:flutter/cupertino.dart';
import 'package:dacn/kana/kana_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KanaPage(),
    );
  }
}

