import 'package:flutter/material.dart';
import 'package:dacn/screens/tab/analys.dart';
import 'package:dacn/screens/tab/dict.dart';
import 'package:dacn/screens/tab/profile.dart';
import 'package:dacn/screens/tab/home.dart';
import 'package:dacn/screens/tab/hint.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();

}
class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  PageController _pageController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(),
          Analys(),
          Dict(),
          Hint(),
          Profile(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.blueGrey[200],
        fixedColor: Colors.purple,
        onTap: navigationTapped,
        currentIndex: _page,

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.insert_invitation),
            title: new Text('Bài học'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.golf_course,),
            title: new Text('Viết Hán tự'),
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

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}