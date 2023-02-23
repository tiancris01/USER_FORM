import 'package:dv_technical_assessment/services/user_state_notifier.dart';
import 'package:dv_technical_assessment/widgets/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/views/form_page.dart';
import 'widgets/views/users_view_page.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserStateNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Double V Technical assessment',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'usersPage': (_) => UsersPage(),
          'formPage': (_) => FormDialog(),
        },
      ),
    );
  }
}
