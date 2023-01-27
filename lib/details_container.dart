// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:eshop/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';
import 'Item.dart';
import 'Prov.dart';

class Details_container extends StatefulWidget {
  String? image;
  String? title;
  String? about;
  double? price;
  int index;


  @override
  _Details_containerState createState() => _Details_containerState();

  Details_container(this.image, this.title, this.about, this.price,this.index);
}

class _Details_containerState extends State<Details_container> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Consumer<Prov>(builder: ((context, prov, child) {
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
              }))
            ],
            title: Center(child: Text("describe")),
            backgroundColor: El_button,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: Image(image: NetworkImage("${widget.image}"))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${widget.title}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      Container(
                          decoration: BoxDecoration(
                              color: El_button,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.price}\$",
                              style: TextStyle(fontSize: 16),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "${widget.about}",
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<Prov>(builder: ((context, prov, child) {
                    return ElevatedButton(
                      onPressed: () {
                        prov.add(items[widget.index]);
                      },
                      child: Text('Add to cart'),
                      style:
                      ElevatedButton.styleFrom(backgroundColor: El_button),
                    );
                  })),
                ),
              ],
            ),
          ),
        ));
  }
}


// ElevatedButton(
// onPressed: () {},
// child: Text('Add to cart'),
// style: ElevatedButton.styleFrom(backgroundColor: El_button),
// ),