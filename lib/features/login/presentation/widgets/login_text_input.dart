import 'package:flutter/material.dart';

class LoginTextInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String errorText;

  const LoginTextInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    required this.errorText,
  });

  @override
  State<LoginTextInput> createState() => _LoginTextInputState();
}

class _LoginTextInputState extends State<LoginTextInput> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
          ? IconButton(onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          }, icon: obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
        ) : null,
      ),
      controller: widget.controller,
    );
  }
}
