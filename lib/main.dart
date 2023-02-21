import 'package:dv_technical_assessment/views/form_page.dart';
import 'package:dv_technical_assessment/views/users_view_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Double V Technical assessment',
      initialRoute: 'usersPage',
      routes: {
        'usersPage': (_) => UsersPage(),
        'formPage': (_) => FormPage(),
      },
    );
  }
}
