import 'package:flutter/material.dart';

import '../models/user.dart';

class UserStateNotifier with ChangeNotifier {
  final List<User> _users = <User>[];
  late User _user;

  set saveUser(User user) {
    this._users.add(user);
    notifyListeners();
  }

  set address(String address) {
    _user.address.add(address);
    notifyListeners();
  }

  void removeAdress(String address) {
    _user.address.remove(address);
    notifyListeners();
  }

  List<User> getUsers() => this._users;
  bool get existUser => (this.getUsers().isNotEmpty) ? true : false;

  User get user => _user;
  set age(int age) => _user.copyWith(age: age);
  set name(String name) => _user.copyWith(name: name);
  set lastName(String lastName) => _user.copyWith(lastName: lastName);
}
