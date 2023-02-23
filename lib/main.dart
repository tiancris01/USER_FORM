import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'services/user_state_notifier.dart';
import 'widgets/helpers/custom_form.dart';
import 'widgets/views/home_page.dart';
import 'widgets/views/users_view_page.dart';

void main() => runApp(const AppWidget());

final userStateRiverpod = ChangeNotifierProvider((ref) => UserStateNotifier());

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      /* providers: [
        ChangeNotifierProvider(create: (_) => UserStateNotifier()),
      ], */
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
