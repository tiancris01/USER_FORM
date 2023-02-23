import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../models/user.dart';
import '../helpers/custom_form.dart';
import '../helpers/no_user_created_message.dart';
import '../helpers/user_list_view.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateRiverpod);

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
            return UserListView(users: ref.read(userStateRiverpod).getUsers());
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
          title: const Text("USER FORM"),
          content: FormDialog(),
        );
      },
    );
  }
}
