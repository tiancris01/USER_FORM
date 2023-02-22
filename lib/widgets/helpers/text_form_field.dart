// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomeTextFormField extends StatefulWidget {
  final String title;
  final TextInputType keyboardType;
  final Function(String? valu) onSave;
  final bool? isInt;
  final bool? isAdress;

  const CustomeTextFormField({
    Key? key,
    required this.title,
    required this.keyboardType,
    required this.onSave,
    this.isInt = false,
    this.isAdress = false,
  }) : super(key: key);

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.title,
        ),
        keyboardType: widget.keyboardType,
        validator: (value) {
          if (widget.isAdress!) {
            if (value == null || value == "") {
              return "Cannot be empty";
            } else {
              return null;
            }
          }
          if (widget.isInt!) {
            if (value == null || int.tryParse(value) == null) {
              return "Must be a number";
            } else {
              return null;
            }
          } else if (value == "" ||
              value == null ||
              value.contains(RegExp(r'[0-9]'), 0)) {
            return "Must be letters";
          } else {
            return null;
          }
        },
        onSaved: (value) => widget.onSave(value!.trim()),
      ),
    );
  }
}
