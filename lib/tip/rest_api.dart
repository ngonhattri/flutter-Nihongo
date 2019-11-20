import 'dart:convert';

import 'package:http/http.dart' as http;



class ApiService {
  static Future<List<dynamic>> getEmployees() async {
    // RESPONSE JSON :
    // [{
    //   "id": "1",
    //   "employee_name": "",
    //   "employee_salary": "0",
    //   "employee_age": "0",
    //   "profile_image": ""
    // }]
    final response = await http.get('https://phongtri.herokuapp.com');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
