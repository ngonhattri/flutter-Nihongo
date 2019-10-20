import 'package:flutter/material.dart';
import 'package:dacn/widgets/placeholder_widget.dart';

class Tab extends StatefulWidget {

 @override
 State<StatefulWidget> createState() {
    return _TabState();
  }
}
class _TabState extends State<Tab> {
  int _currentIndex = 0;
  final List<Widget> _children = [
  PlaceholderWidget(Colors.red),
  PlaceholderWidget(Colors.deepOrange),
  PlaceholderWidget(Colors.green),
  PlaceholderWidget(Colors.red),
  PlaceholderWidget(Colors.blue)
  ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.red,
       unselectedItemColor: Colors.blueGrey[200],
       fixedColor: Colors.lightBlue[300],
       onTap: onTabTapped,
       currentIndex: _currentIndex,
       
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.insert_invitation),
           title: new Text('Bài học'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.golf_course,),
           title: new Text('Tiến độ'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.keyboard),
           title: new Text('Từ điển')
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.bookmark),
           title: new Text('Mẹo'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.people),
           title: new Text('Hồ sơ'),
         ),
       ],
     ),
   );
 }
 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}