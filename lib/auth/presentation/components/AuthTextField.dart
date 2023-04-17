import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final void Function(String) onValueChanged;
  final String description;
  bool isPasswordField = false;

  AuthTextField({
    super.key,
    required this.onValueChanged,
    required this.description,
    this.isPasswordField = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: isPasswordField,
          style: const TextStyle(color: Colors.white),
          onChanged: onValueChanged,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white)
            ),
            labelText: description,
            labelStyle: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}