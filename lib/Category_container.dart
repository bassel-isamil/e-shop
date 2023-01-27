// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eshop/Colors.dart';
import 'package:eshop/Item.dart';
import 'package:eshop/details_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Prov.dart';

class Category_container extends StatefulWidget {
  var number = 1;
  String? image;
  String? title;
  String? about;
  double? price;
  int index;

  @override
  State<Category_container> createState() => _Category_containerState();

  Category_container(this.image, this.title, this.about, this.price,this.index);
}

class _Category_containerState extends State<Category_container> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
          return Details_container("${widget.image}", "${widget.title}",
              "${widget.about}", widget.price,widget.index);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: [
            //this is first Expanded widget and this had image for item
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Positioned(
                        child: Image(image: NetworkImage("${widget.image}")),
                      ))
                ],
              ),
            ),
            //this is second Expanded widget and this had (title - about - counter - icon button ' + ' for add counter -icon button for minus for counter)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "${widget.title}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Text(
                              "${widget.about}",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.number++;
                                });
                              },
                              icon: Icon(Icons.add)),
                          Text("${widget.number}"),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (widget.number == 1) {
                                    widget.number = 1;
                                  } else {
                                    widget.number--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Text("${widget.price}" + " " + "\$"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
