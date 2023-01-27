import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ("please enter your age ");
          }
        },
        decoration: const InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
            labelText: "age",
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
      ),
    );
  }
}
