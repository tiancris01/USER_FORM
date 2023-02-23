import 'package:dv_technical_assessment/services/user_state_notifier.dart';
import 'package:dv_technical_assessment/widgets/helpers/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class UserListView extends StatefulWidget {
  const UserListView({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserStateNotifier>(context);
    return ListView.builder(
      itemCount: /* userState.getUsers().length  */ widget.users.length,
      itemBuilder: (_, i) {
        return Card(
          color: Colors.blueGrey[50],
          margin: EdgeInsets.only(bottom: 10),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            trailing: IconButton(
              onPressed: () {
                _showDialog(widget.users[i]);
              },
              icon: const Icon(Icons.add),
            ),
            leading: CircleAvatar(
              child: Text(
                  /* '${userState.getUsers()[i].age}' */ '${widget.users[i].age}'),
            ),
            title: Text(
                '${widget.users[i].name} ' /* '${userState.getUsers()[i].name} ' */
                '${widget.users[i].lastName}' /* '${userState.getUsers()[i].lastName}' */),
            children: /* userState
                .getUsers()[i] */
                widget.users[i].address
                    .map(
                      (e) => Column(
                        children: [
                          ListTile(
                            trailing: IconButton(
                                onPressed: () {
                                  userState.removeAdress(widget.users[i], e);
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
        );
      },
    );
  }

  _showDialog(User user) {
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
