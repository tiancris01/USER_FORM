import 'package:dv_technical_assessment/services/user_state_notifier.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> users;
    UserStateNotifier userStateNotifier = UserStateNotifier.instance;

    users = userStateNotifier.getUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Page"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (!userStateNotifier.existUser) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error_outline, size: 50, color: Colors.red),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Ups... It seems like no user has been created yet. Please create one",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, i) {
                return ExpansionTile(
                  trailing: IconButton(
                    onPressed: () {
                      users[i].address.add("Nueva address");
                      print(users[i].name);
                    },
                    icon: Icon(Icons.add),
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
                                    print("delete");
                                  },
                                  icon: Icon(Icons.delete)),
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
          ;
        },
      ),
    );
  }
}
