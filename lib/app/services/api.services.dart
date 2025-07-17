import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

final ApiServices api = ApiServices();

class ApiServices {
  var baseURL = 'https://dummyjson.com';

  Future getHttp(String path) async {
    var fullURL = Uri.parse(baseURL+path);
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await http.get(fullURL, headers: headers);
    if (response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      log('Request failed with status code: ${response.statusCode}');
    }
  }
}