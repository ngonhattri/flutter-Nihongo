import 'package:flutter/material.dart';
import 'package:dacn/quiz/ui/pages/home.dart';

void main() => runApp(Analys());

class Analys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đồ Án Tổng Hợp',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.indigo,
          fontFamily: "Montserrat",
          buttonColor: Colors.purple,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textTheme: ButtonTextTheme.primary
          )
      ),
      home: HomePage(),
    );
  }
}


