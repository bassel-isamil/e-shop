// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, camel_case_types, must_be_immutable, avoid_unnecessary_containers

import 'package:eshop/Colors.dart';
import 'package:flutter/material.dart';


class Cart_container extends StatefulWidget {
  String? image;
  String? title;
  double? price;

  Cart_container(this.image, this.title, this.price);

  @override
  State<Cart_container> createState() => _Cart_containerState();
}

class _Cart_containerState extends State<Cart_container> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(
                    image: NetworkImage(
                        "${widget.image}")),
                Container(
                  child: Column(
                    children: [
                      Text("${widget.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      Text("${widget.price}"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: El_button,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (number == 1) {
                                number = 1;
                              } else {
                                number--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove)),
                      Text("$number"),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              number++;
                            });
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("delete"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: El_button,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
// color: Colors.blue,
// child: Column(
// children: [
// // photo expanded
// Row(
// children: [
// Expanded(
// flex: 1,
// child: Column(
// children: [
// Image(
// image: NetworkImage(
// 'https://m.media-amazon.com/images/I/51sgZiMX+DL._AC_SX425_.jpg'))
// ],
// ),
// ),
// Expanded(
// flex: 2,
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("title"),
// Text("price"),
// ],
// ),
// Row(
// children: [Text("about")],
// ),
// ],
// ),
// )
// ],
// ),
//
// // counter Expanded
// // Row(
// //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //   children: [
// //     Column(
// //       children: [
// //         Container(
// //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
// //           color: Colors.white,
// //         child: Row(
// //           children: [
// //             IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
// //             Text("$number"),
// //             IconButton(onPressed: (){}, icon: Icon(Icons.add)),
// //           ],
// //         ),
// //         )
// //       ],
// //     ),
// //     Column(
// //       children: [Text("delete button")],
// //     ),
// //   ],
// // ),
// ],
// ));
