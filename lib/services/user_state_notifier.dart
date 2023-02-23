import 'package:flutter/material.dart';

import '../models/user.dart';

class UserStateNotifier with ChangeNotifier {
  final List<User> _users = <User>[];

  final List<String> _listAddress = <String>[];
  late User _user;

  void saveUsers(User user) {
    _users.add(user);
    notifyListeners();
  }

  void listAddress(User user, String address) {
    user.address.add(address) /* _listAddress.add(address) */;
    notifyListeners();
  }

  List<String> getListAddress() => _listAddress;

  void removeAdress(User user, String address) {
    user.address.remove(address) /* _listAddress.add(address) */;
    notifyListeners();
  }

  List<User> getUsers() => _users;

  bool get existUser => (getUsers().isNotEmpty) ? true : false;
}
