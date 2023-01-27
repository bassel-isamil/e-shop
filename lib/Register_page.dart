// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:convert';

import 'package:eshop/Age.dart';
import 'package:eshop/Email.dart';
import 'package:eshop/Name.dart';
import 'package:eshop/Password.dart';
import 'package:eshop/Title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Colors.dart';
import 'Home.dart';
import 'Login_page.dart';

class Register_page extends StatelessWidget {
  @override
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController name;


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Register")),
          backgroundColor: El_button,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(
            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNtCh17cCUl3OeiiqnqYb72OPfHLLRVte3sg5Lz5duGg&s"),
            Name(name=TextEditingController()),
            // Age(),
            // T(),
            Email(email = TextEditingController()),
            Password(password = TextEditingController()),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                register(
                    context, name.text, email.text, password.text);
              },
              child: const Text("Register"),
              style: ElevatedButton.styleFrom(backgroundColor: El_button),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("have an account"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return Login_page();
                    }));
                  },
                  child: const Text("Sign in",
                      style: TextStyle(
                        color: Te_Button,
                        decoration: TextDecoration.underline,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

register(
    BuildContext context, String name, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://retail.amit-learning.com/api/register'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
      return Home();
    }));
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("user registered successfully");
    print(jsonDecode(response.body)['token']);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("this account has not been taken ")));

    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create account.');
  }
}
