import 'package:dv_technical_assessment/services/user_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import 'text_form_field.dart';

class FormDialog extends StatefulWidget {
  const FormDialog({super.key});

  @override
  State<FormDialog> createState() => _FormDialogState();
}

class _FormDialogState extends State<FormDialog> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    late String name;
    late String lastName;
    late int age;
    final List<String> listAddress = <String>[];

    final userState = Provider.of<UserStateNotifier>(context);

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: CustomeTextFormField(
              title: "Name",
              keyboardType: TextInputType.name,
              onSave: (value) => name = value!,
            ),
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
              onSave: (value) =>
                  listAddress.add(value!) /* userState.listAddress = value!, */
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
                  address: listAddress,
                );
                userState.saveUsers(user);
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}

class FormDialogAdress extends StatefulWidget {
  final User user;
  const FormDialogAdress({
    super.key,
    required this.user,
  });

  @override
  State<FormDialogAdress> createState() => _FormDialogAdressState();
}

class _FormDialogAdressState extends State<FormDialogAdress> {
  final formKeyAddress = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    late String address;

    final userState = Provider.of<UserStateNotifier>(context);

    return Form(
      key: formKeyAddress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: CustomeTextFormField(
              isAdress: true,
              title: "Address",
              keyboardType: TextInputType.name,
              onSave: (value) => address = value!,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              if (formKeyAddress.currentState?.validate() == true) {
                formKeyAddress.currentState?.save();
                userState.listAddress(widget.user, address);
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}