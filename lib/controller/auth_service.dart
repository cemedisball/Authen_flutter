import 'package:flutter/material.dart';
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
  "user_name":username,
  "password":password,
  }));
  print(response.statusCode);
  
  }
  
  
  Future<void>register(String name , String username , String password ,String role) async{
    final response = await http.post(Uri.parse("$apiURL/api/auth/register"),
    headers: {"Content-Type" : "application/json"},
    body: jsonEncode({
      "name" : name,
      "user_name" : username,
      "password" : password,
      "role" : role,
  }));
  print(response.statusCode);
  if (response.statusCode==200){
    print("Rsgistration Successful");
  }else{
    print("Rsgistration Failed");
  }
  }
}