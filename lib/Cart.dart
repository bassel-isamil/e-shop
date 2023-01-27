// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, file_names, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:eshop/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Item.dart';
import 'Prov.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("cart")),
        backgroundColor: El_button,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: Consumer<Prov>(builder: ((context, prov, child) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: prov.List_of_product.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Consumer<Prov>(builder: ((context, prov, child) {
                      return Card(
                        child: ListTile(
                          subtitle: Text(
                              "${prov.List_of_product[index].price}" + "\$" +
                                  " " + "${prov.List_of_product[index].about}"),
                          leading: CircleAvatar(
                            backgroundImage:
                            NetworkImage(prov.List_of_product[index].img_url),
                          ),
                          title: Text(prov.List_of_product[index].title),
                          trailing: IconButton(
                              onPressed: () {
                                prov.remove(prov.List_of_product[index]);
                              }, icon: Icon(Icons.delete)),
                        ),
                      );
                    }));
                    //Cart_container("https://m.media-amazon.com/images/I/51sgZiMX+DL._AC_SX425_.jpg", "title", 33);
                  });
            })),
          ),
          Consumer<Prov>(builder: ((context, prov, child) {
            return ElevatedButton(onPressed: () {},
              child: Text("Pay" +" "+ "${prov.price}"+"\$"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(El_button)),);
          })),
        ],
      ),
    );
  }
}
//