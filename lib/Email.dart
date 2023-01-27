import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  late final email_controller;
  Email(this.email_controller);

  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.email_controller,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {

          if (value == null || value.isEmpty) {
            return ("please enter your E-mail");
          }
          else if (!value.contains("@")){
            return("this E-mail is not correct ");
          }
        },
        decoration: const InputDecoration(
            labelText: "E-mail",
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
            border: OutlineInputBorder()),
      ),
    );
  }
}



