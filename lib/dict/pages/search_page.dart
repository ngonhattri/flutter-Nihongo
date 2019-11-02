import 'package:flutter/material.dart';
import 'package:dacn/dict/models/category.dart';
import 'package:dacn/dict/widgets/word/category_item.dart';
import 'package:dacn/dict/pages/search_appbar.dart';

import 'package:dacn/dict/widgets/results/search_results.dart';
import 'package:dacn/dict/widgets/results/kanji_search_results.dart';

class SearchPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => SearchPageState();
  }
  
  class SearchPageState extends State<SearchPage>{
  GlobalKey<SearchResultsState> key = GlobalKey();
_buildBody(Widget fallbackMessage){
      return KanjiSearchResults(key: key,message: fallbackMessage); 
    }



  @override
  Widget build(BuildContext context) {
    
    final orientation = MediaQuery.of(context).orientation;

    final fallbackMessage = Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CategoryText(
            category: Category(
              title: "Kanji",
              subtitle: "Kanji dict",
              backgroundColor: Colors.white,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );

    return WillPopScope(
      child: Scaffold(
        appBar: SearchAppBar( updateSearch, clearSearch),
        body: _buildBody(fallbackMessage),
        resizeToAvoidBottomInset:
            orientation == Orientation.portrait,
      ), onWillPop: () async{
        return true;
      },
      
    );
    
    
  }
  updateSearch(value) {
    key.currentState.onSearch(value);
  }

  clearSearch() {
    key.currentState.onClear();
  }
  
}


