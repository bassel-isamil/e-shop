// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  @override
  late final name_controller;
  Name(this.name_controller);
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ("please enter your name");
          }

        },
        controller: widget.name_controller,
        keyboardType: TextInputType.text,
        // نوع اللغة اللي هتظهر في الكيبورد
        obscureText: false,
        // لاخفاء الكلام
        decoration: const InputDecoration(
          
            labelText: "name",
            // hintText: "name", (same label text)
            // ignore: prefer_const_constructors
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green)),
            // fillColor: Colors.red   لتغسسر لون الخانة
            contentPadding: EdgeInsets.all(8.0) //للمساحة الداخلية
            ),
      ),
    );
  }
}
