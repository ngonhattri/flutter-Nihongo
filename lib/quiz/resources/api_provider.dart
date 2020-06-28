import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dacn/quiz/models/category.dart';
import 'package:dacn/quiz/models/question.dart';

//const String baseUrl = "https://opentdb.com/api.php";
const String baseUrl = "https://tri-ngo.herokuapp.com";

Future<List<Question>> getQuestions(
    Category category, int total, String difficulty) async {
  String url = "$baseUrl?amount=$total&category=${category.id}";
  if (difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }
  print(url);
  http.Response res = await http.get(url);
  List<Map<String, dynamic>> questions =
      List<Map<String, dynamic>>.from(json.decode(res.body)["data"]);
  return Question.fromData(questions);
}
