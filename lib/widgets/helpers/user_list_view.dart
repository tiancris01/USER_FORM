import 'package:dv_technical_assessment/services/user_state_notifier.dart';
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
    return ListView.builder(
      itemCount: widget.users.length,
      itemBuilder: (_, i) {
        return Card(
          color: Colors.blueGrey[50],
          margin: EdgeInsets.only(bottom: 10),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            trailing: IconButton(
              onPressed: () {
                widget.users[i].address.add("Nueva address");
                setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
            leading: CircleAvatar(child: Text('${widget.users[i].age}')),
            title:
                Text('${widget.users[i].name} ' '${widget.users[i].lastName}'),
            children: widget.users[i].address
                .map(
                  (e) => Column(
                    children: [
                      ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              widget.users[i].address.remove("Nueva address");
                              setState(() {});
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
}
