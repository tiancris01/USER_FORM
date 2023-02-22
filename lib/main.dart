import 'package:flutter/material.dart';

import 'widgets/form_page.dart';
import 'widgets/users_view_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Double V Technical assessment',
      initialRoute: 'formPage',
      routes: {
        'usersPage': (_) => UsersPage(),
        'formPage': (_) => FormPage(),
      },
    );
  }
}
