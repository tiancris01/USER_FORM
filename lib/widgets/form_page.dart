import 'package:dv_technical_assessment/services/user_state_notifier.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import 'helpers/text_form_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    late String name;
    late String lastName;
    late int age;
    final List<String> address = <String>[];
    UserStateNotifier userStateNotifier = UserStateNotifier.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeTextFormField(
              title: "Name",
              keyboardType: TextInputType.name,
              onSave: (value) => name = value!,
            ),
            CustomeTextFormField(
              title: "Last name",
              keyboardType: TextInputType.name,
              onSave: (value) => lastName = value!,
            ),
            CustomeTextFormField(
              isInt: true,
              title: "Age",
              keyboardType: TextInputType.name,
              onSave: (value) => age = int.parse(value!),
            ),
            CustomeTextFormField(
              isAdress: true,
              title: "Address",
              keyboardType: TextInputType.name,
              onSave: (value) => address.add(value!),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  formKey.currentState?.save();
                  User user = User(
                      lastName: lastName,
                      name: name,
                      age: age,
                      address: address);
                  userStateNotifier.saveUser = user;
                  ;
                  //TODO: Navigate to the Users Page;
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next_outlined),
        onPressed: () => Navigator.pushNamed(context, "usersPage"),
      ),
    );
  }
}
