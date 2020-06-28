import 'package:flutter/cupertino.dart';
import 'package:dacn/profile/info.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InfoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
