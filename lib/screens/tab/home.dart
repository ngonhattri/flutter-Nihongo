import 'package:flutter/cupertino.dart';
import 'package:dacn/kana/kana_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KanaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

