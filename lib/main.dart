// ignore_for_file: prefer_const_constructors

import 'package:eshop/Cart.dart';
import 'package:eshop/Home.dart';
import 'package:eshop/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Prov.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return Prov();
    },
    child: MaterialApp(debugShowCheckedModeBanner: false, home: Login_page()),
  ));
}
