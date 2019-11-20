import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:dacn/kana/kana_model.dart';


import 'package:path_provider/path_provider.dart';

class DBProvider {
  DBProvider._();

  final String kDatabaseName = "database.db";
  final List<String> tables = ["hiragana", "katakana", "kanji", "words", "grammar"];
  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, kDatabaseName);

    ByteData data = await rootBundle.load(join("assets", kDatabaseName));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    return openDatabase(path, readOnly: true);
  }

  getSign(int id) async {
    final db = await database;
    var res = await db.query("hiragana", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Kana.fromMap(res.first) : null;
  }

  Future<List<Kana>> getAllKanaSigns(String tableName) async {
    assert(tables.contains(tableName));
    
    final db = await database;
    var res = await db.query(tableName);
    print(res);

    List<Kana> list =
    res.isNotEmpty ? res.map((c) => Kana.fromMap(c)).toList() : [];

    return list;
  }

  
}