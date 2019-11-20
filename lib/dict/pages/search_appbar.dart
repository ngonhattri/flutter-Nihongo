import 'package:flutter/material.dart';

import 'package:dacn/dict/widgets/search/search_bar.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  
  final Function onSearch;
  final Function onClear;

  SearchAppBar( this.onSearch, this.onClear);

  @override
  SearchAppBarState createState() => SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(56.0 + 68.0);
}

class SearchAppBarState extends State<SearchAppBar> {
  
  
  String capitalize(String text) {
    if (text == null || text.isEmpty) return null;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
         
          return AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text("Từ điển hán tự", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
            actions: <Widget>[
              IconButton(
                tooltip: "Search",
                icon: Icon(Icons.search),
                onPressed: () => null,
              )
            ],
          );
        }

        return AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Từ điển hán tự", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
          bottom: PreferredSize(
            child: SearchBar(widget.onSearch, widget.onClear, Colors.white),
            preferredSize: Size.fromHeight(68.0),
          ),
        );
      },
    );
  }
}
