import 'package:dv_technical_assessment/services/user_state_notifier.dart';
import 'package:dv_technical_assessment/widgets/helpers/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/user.dart';

class UserListView extends ConsumerWidget {
  const UserListView({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userState = Provider.of<UserStateNotifier>(context);
    final userState = ref.watch(userStateRiverpod);

    return ListView.builder(
      itemCount: /* userState.getUsers().length  */ users.length,
      itemBuilder: (_, i) {
        return Card(
          color: Colors.blueGrey[50],
          margin: EdgeInsets.only(bottom: 10),
          child: Dismissible(
            key: UniqueKey(),
            child: ExpansionTile(
              backgroundColor: Colors.white,
              trailing: IconButton(
                onPressed: () {
                  _showDialog(users[i], context);
                },
                icon: const Icon(Icons.add),
              ),
              leading: CircleAvatar(
                child: Text(
                    /* '${userState.getUsers()[i].age}' */ '${users[i].age}'),
              ),
              title: Text(
                  '${users[i].name} ' /* '${userState.getUsers()[i].name} ' */
                  '${users[i].lastName}' /* '${userState.getUsers()[i].lastName}' */),
              children: /* userState
                  .getUsers()[i] */
                  users[i]
                      .address
                      .map(
                        (e) => Column(
                          children: [
                            ListTile(
                              trailing: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(userStateRiverpod)
                                        .removeAdress(users[i], e);
                                  },
                                  icon: const Icon(Icons.delete)),
                              title: Text(e),
                            ),
                            const Divider(height: 1)
                          ],
                        ),
                      )
                      .toList(),
            ),
          ),
        );
      },
    );
  }

  _showDialog(User user, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("NEW ADDRESS"),
          content: FormDialogAdress(
            user: user,
          ),
        );
      },
    );
  }
}
