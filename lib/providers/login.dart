import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/loginDetails.dart';

class Login with ChangeNotifier {
  bool _isLogged = false;
  bool _isLoggingIn = false;
  String _authToken = "";
  String _url = "https://kisanhub.mockable.io/flutter-test/login";

  Future<void> logIn(LoginDetails details) async {
    return http
        .post(
      _url,
      body: json.encode(
        {
          "username": details.id,
          "password": details.password,
        },
      ),
    )
        .then((response) async {
      _authToken = json.decode(response.body)["userToken"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        prefs.setString('token', _authToken);
        _isLogged = true;
        _isLoggingIn = false;
      } else {
        prefs.setString('token', null);
        _isLogged = false;
        _isLoggingIn = false;
      }
      notifyListeners();
    });
  }

  void isLoggingIn() {
    _isLoggingIn = true;

    notifyListeners();
  }

  bool getIsLoggingIn() {
    return _isLoggingIn;
  }

  bool getIsLoggedIn() {
    return _isLogged;
  }

  String getAuthToken() {
    return _authToken;
  }
}
