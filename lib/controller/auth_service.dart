import 'package:flutter_lab1/variables.dart';
import 'package:flutter_lab1/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class  AuthService{
 Future <  void >login(String username, String password ) async{
    print(apiURL);

final response = await http.post(Uri.parse("$apiURL/api/auth/login"),
headers:{"Content-Type":"application/json"},
body: jsonEncode(
  {
  "username":username,
  "password":password,
  }));
  print(response.statusCode);
  }
}