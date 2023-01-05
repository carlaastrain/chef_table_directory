import 'package:flutter/material.dart';

class LogInSignUpScreenTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPasswordType;
  final TextEditingController controller;

  const LogInSignUpScreenTextField(
      {super.key,
      required this.text,
      required this.icon,
      required this.isPasswordType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
        ),
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.9),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
      ),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
