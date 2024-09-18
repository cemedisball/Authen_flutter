import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/user_model.dart';



class UserProvider extends ChangeNotifier{
  User? _user;
  String? _accesToken;
  String? _refreshToken;
  User get user => _user!;
  String get accessToken => _accesToken!;
  String get RefreshToken => _refreshToken!;

  void onLogin(UserModel userModel) {
    _user = userModel.user;
    _accesToken = userModel.accessToken;
    _refreshToken = userModel.refreshToken;
    notifyListeners();
  }

  void onLogout(){
    _user = null;
    _accesToken = null;
    _refreshToken = null;
    notifyListeners();
  }
  void updadateAccessToken(String token){
    _accesToken = token;
   
    notifyListeners();
  }
}