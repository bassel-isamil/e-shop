import 'package:flutter/material.dart';

class T extends StatefulWidget {
  const T({Key? key}) : super(key: key);

  @override
  State<T> createState() => _TState();
}

class _TState extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ("please enter your title ");
          }
        },
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Title",
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
      ),
    );
  }
}
