import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dacn/dict/models/kanji.dart';

class KanjiItem extends StatelessWidget {
  final Kanji kanji;
  KanjiItem(this.kanji);

  get radicals => kanji.radicals.map((r) => r.radValue);
  get meanings => kanji.meanings.join(", ");
  get onReadings => kanji.onReadings.join(", ");
  get kunReadings => kanji.kunReadings.join(", ");
  get jlpt => kanji.jlpt == null ? "" : "\nJLPT: N${kanji.jlpt}";
  get grade => kanji.grade == null ? "" : "\nLớp: ${kanji.grade}";
  get variant => kanji.variant == null ? "" : kanji.variant.variant;
  get code => kanji.literal.codeUnitAt(0);

  @override
  Widget build(BuildContext context) {
    
    print(radicals);
    print(variant);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  kanji.literal,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                    fontFamily: "DroidJP",
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Số nét: ${kanji.strokeCount}$jlpt$grade",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ],
        ),
        Text("Nghĩa:"),
        Text("$meanings", style: TextStyle(fontWeight: FontWeight.w400)),
        SizedBox(height: 8),
        Text("Cách đọc:"),
        Text("Âm Kun: $kunReadings", style: TextStyle(fontFamily: "DroidJP")),
        Text("Âm On: $onReadings", style: TextStyle(fontFamily: "DroidJP")),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SvgPicture.asset(
            "assets/kanji_strokes/${code}_frames.svg",
            height: 60,
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
