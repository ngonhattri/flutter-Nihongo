import 'dart:convert';

Kana kanaFromJson(String str) {
  final jsonData = json.decode(str);
  return Kana.fromMap(jsonData);
}

String kanaToJson(Kana data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Kana {
  int id;
  String sign;
  String reading;
  var gifImage;


  Kana({
    this.id,
    this.sign,
    this.reading,
    this.gifImage
  });

  factory Kana.fromMap(Map<String, dynamic> json) => new Kana(
    id: json["id"],
    sign: json["sign"],
    reading: json["reading"],
    gifImage: json["gif"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "sign": sign,
    "reading": reading,
    "gif": gifImage,
  };
}