import 'package:expense/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(id: '', username: '', email: '', token: '', password: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserModel(User user) {
    _user = user;
    notifyListeners();
  }
}
