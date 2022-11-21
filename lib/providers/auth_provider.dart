import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transfibank/constants/constants.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  var user = {};
  final _baseURL = Constants.baseUrl;

  bool get isAuthenticated => _isAuthenticated;

  void setUser(Map<String, dynamic> user) {
    user;
    _isAuthenticated = true;
    notifyListeners();
  }

  loginWithID(String userID) async {
    var url = Uri.http(
      _baseURL,
      '/api/users/$userID/unencrypted',
    );

    final response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      _isAuthenticated = true;
      user = jsonDecode(response.body)['result'];
      notifyListeners();
    }
  }
}
