// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, use_build_context_synchronously, sort_child_properties_last

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eshop/Email.dart';
import 'package:eshop/Home.dart';
import 'package:eshop/Password.dart';
import 'package:eshop/Register_page.dart';
import 'package:eshop/Reset_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Colors.dart';
import 'Prov.dart';

class Login_page extends StatefulWidget {
  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  late TextEditingController password;

  late TextEditingController email;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: El_button,
          title: Center(child: Text("Sign in")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Email(email = TextEditingController()),
            Password(password = TextEditingController()),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                login(context, email.text, password.text);
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: El_button,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return Reset_pagae();
                }));
              },
              child: Text("Forget my Password",
                  style: TextStyle(
                    color: Te_Button,
                    decoration: TextDecoration.underline,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("do not have an Account ??  "),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return Register_page();
                    }));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Te_Button,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

login(BuildContext context, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://retail.amit-learning.com/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // ignore: non_constant_identifier_names
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
      return Home();
    }));
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("user logged in successfully");
    print(jsonDecode(response.body)['token']);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "email or password is not correct ",
          style: TextStyle(color: Colors.white),
        )));
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
//    print(jsonDecode(response.body));

    throw Exception('Failed to login ');
  }
}

//
// return ElevatedButton(
// onPressed: () {
// tester.email=this.email as String?;
// login(context, email.text, password.text);
// },
// child: Text("Login"),
// style: ElevatedButton.styleFrom(
// backgroundColor: El_button,
// ),
// );
