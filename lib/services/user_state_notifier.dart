import 'package:flutter/material.dart';

import '../models/user.dart';

class UserStateNotifier with ChangeNotifier {
  final List<User> _users = <User>[];

  set saveUser(User user) {
    this._users.add(user);
    notifyListeners();
  }

  List<User> getUser() => this._users;
  bool get existUser => (this.getUser().isNotEmpty) ? true : false;
}
