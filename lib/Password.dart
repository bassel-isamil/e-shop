import 'package:flutter/material.dart';

class Password extends StatefulWidget {

  @override
   final password_controller;
  Password(this.password_controller);

  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.password_controller,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ("please enter your Password");
          } else if (value.length < 8) {
            return "Enter at least 8 characters ";
          }
        },
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
            labelText: "Password", border: OutlineInputBorder()
        ),
      ),
    );
  }
}





