import 'package:flutter/material.dart';
import 'package:dacn/dict/data/kanji_dao.dart';
import 'package:dacn/dict/widgets/kanji/kanji_list.dart';
import 'package:dacn/dict/widgets/results/search_results.dart';

class KanjiSearchResults extends SearchResults {
  KanjiSearchResults({message, key}) : super(message: message, key: key);

  @override
  State<StatefulWidget> createState() => _KanjiSearchResultsState();
}

class _KanjiSearchResultsState extends SearchResultsState {
  final _kanjiDao = KanjiDao();

  getKanji(String text) => _kanjiDao.getKanji(text);

  String _value;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: FutureBuilder(
            future: getKanji(_value),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null || snapshot.data?.length == 0)
                  return Center(child: Text("Không có dữ liệu"));
                return KanjiList(snapshot.data);
              } else {
                return widget.message;
              }
            },
          ),
        )
      ],
    );
  }

  @override
  void onClear() {
    print("close");
    setState(() {
      _value = "";
    });
  }

  @override
  void onSearch(value) {
    print("update: $value");
    setState(() {
      _value = value;
    });
  }
}
