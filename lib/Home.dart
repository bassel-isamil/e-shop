// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'dart:convert';

import 'Category_Model.dart';
import 'Prov.dart';
import "package:provider/provider.dart";
import 'package:eshop/Cart.dart';
import 'package:eshop/Colors.dart';
import 'package:eshop/Item.dart';
import 'package:eshop/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Category_container.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var ListofCategory = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 33,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Category_container(
                  items[index].img_url,
                  items[index].title,
                  items[index].about,
                  items[index].price,
                  index);
            }),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "data:image/jpeg;base64,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"),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "data:image/jpeg;base64,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"),
                                fit: BoxFit.cover)),
                        accountName:
                            Consumer<Prov>(builder: ((context, tester, child) {
                          return Text("${tester.name}");
                        })),
                        accountEmail:
                            Consumer<Prov>(builder: ((context, tester, child) {
                          return Text("${tester.e}");
                        })),
                      ),
                      ListTile(
                        title: const Text('Home'),
                        leading: Icon(Icons.home),
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (buildeContext) {
                            return Home();
                          }));
                        },
                      ),
                      ListTile(
                        title: Text("My product"),
                        leading: Icon(Icons.add_shopping_cart),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext) {
                            return Cart();
                          }));
                        },
                      ),
                      ListTile(
                        title: const Text('About'),
                        leading: Icon(Icons.help_center),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("log out"),
                        leading: Icon(Icons.logout),
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext) {
                            return Login_page();
                          }));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: El_button,
          title: Text("home"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<Prov>(builder: ((context, prov, child) {
                return Row(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          right: 30,
                          bottom: 22,
                          child: Container(
                            child: Text(
                              "${prov.List_of_product.length}",
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black87),
                            ),

// padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
// color: Colors.limeAccent,
                                shape: BoxShape.circle),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext) {
                                return Cart();
                              }));
                            },
                            icon: Icon(Icons.shopping_cart)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("${prov.price}"),
                    ),
                  ],
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}

// @override
// void initState() {
//   getCategory();
// }
//
// Future<dynamic> getCategory() async {
//   final response = await http
//       .get(Uri.parse('http://retail.amit-learning.com/api/categories'));
//
//   if (response.statusCode == 200) {
//     var listofMapsCategory = jsonDecode(response.body)['categories'];
//     print(jsonDecode(response.body)['categories']);
//
//     for (var n in listofMapsCategory) {
//       items.add(CategoryModel.fromJson(n));
//     }
//     for (var m in items) {}
//   }
// }
