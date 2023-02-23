import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../models/user.dart';
import 'text_form_field.dart';

class FormDialog extends ConsumerWidget {
  FormDialog({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String name;
    late String lastName;
    late int age;
    final List<String> listAddress = <String>[];
    final userState = ref.watch(userStateRiverpod);

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
              onSave: (value) => listAddress.add(value!)),
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
                ref.read(userStateRiverpod).saveUsers(user);
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

class FormDialogAdress extends ConsumerWidget {
  final User user;
  FormDialogAdress({
    super.key,
    required this.user,
  });

  final formKeyAddress = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String address;
    final userState = ref.watch(userStateRiverpod);

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
                ref.read(userStateRiverpod).listAddress(user, address);
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
