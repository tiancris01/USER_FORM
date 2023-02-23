import 'package:flutter/material.dart';

import '../../models/user.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, i) {
        return ExpansionTile(
          trailing: IconButton(
            onPressed: () {
              users[i].address.add("Nueva address");
            },
            icon: const Icon(Icons.add),
          ),
          leading: CircleAvatar(child: Text('${users[i].age}')),
          title: Text('${users[i].name} ' '${users[i].lastName}'),
          children: users[i]
              .address
              .map(
                (e) => Column(
                  children: [
                    ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            users[i].address.remove("Nueva address");
                          },
                          icon: const Icon(Icons.delete)),
                      title: Text(e),
                    ),
                    const Divider(height: 1)
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}
