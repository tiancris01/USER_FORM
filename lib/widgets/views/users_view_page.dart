import 'package:dv_technical_assessment/widgets/views/form_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/user_state_notifier.dart';
import '../helpers/no_user_created_message.dart';
import '../helpers/user_list_view.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    List<User> users;
    final userState = Provider.of<UserStateNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (!userState.existUser) {
            return const NoUserCreatedMessage();
          } else {
            return UserListView(users: userState.getUsers());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("USER FORM"),
          content: FormDialog(),
        );
      },
    );
  }
}
