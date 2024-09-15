import 'package:flutter_lab1/variables.dart';
import 'package:flutter_lab1/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  Future<UserModel> login(String userName, String password) async {
    print(apiURL);

    final response = await http.post(Uri.parse("$apiURL/api/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "user_name": userName,
          "password": password,
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> register(
      String name, String userName, String password, String role) async {
    final response = await http.post(Uri.parse("$apiURL/api/auth/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "user_name": userName,
          "password": password,
          "role": role,
        }));
    print(response.statusCode);
    if (response.statusCode == 201) {
      print("Rsgistration Successful");
    } else {
      print("Rsgistration Failed");
    }
  }
}
