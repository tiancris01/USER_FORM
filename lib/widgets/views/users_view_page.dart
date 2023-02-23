import '../helpers/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/user.dart';
import '../../services/user_state_notifier.dart';
import '../helpers/no_user_created_message.dart';
import '../helpers/user_list_view.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<User> users;
    final userState = ref.watch(userStateRiverpod);
    // final userState = Provider.of<UserStateNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: const Text("USERS"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (!userState.existUser) {
            return const NoUserCreatedMessage();
          } else {
            return UserListView(
                users: ref
                    .read(userStateRiverpod)
                    .getUsers() /* userState.getUsers() */);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("USER FORM"),
          content: FormDialog(),
        );
      },
    );
  }
}
