import 'package:dv_technical_assessment/models/user.dart';

class UserStateNotifier {
  final List<User> _users = <User>[];
  static UserStateNotifier? _instance;

  UserStateNotifier._internal();

  static UserStateNotifier get instance {
    _instance ??= UserStateNotifier._internal();
    return _instance!;
  }

  set saveUser(User user) => instance._users.add(user);
  List<User> getUser() => instance._users;
  bool get existUser => (instance.getUser().isNotEmpty) ? true : false;
}
