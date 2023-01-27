// ignore_for_file: prefer_const_constructors

import 'package:eshop/Email.dart';
import 'package:flutter/material.dart';

import 'Colors.dart';

class Reset_pagae extends StatelessWidget {
  @override
  late TextEditingController email;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: El_button,
          title: const Center(child: Text("Reset Password")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter your email to reset Password"),
            SizedBox(
              height: 20,
            ),
            Email(email=TextEditingController()),
            ElevatedButton(
              onPressed: () {},
              child: Text("Reset"),
              style: ElevatedButton.styleFrom(backgroundColor: El_button),
            )
          ],
        ),
      ),
    );
  }
}
