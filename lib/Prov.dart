// ignore_for_file: non_constant_identifier_names

import 'package:eshop/Item.dart';
import 'package:flutter/material.dart';

class Prov with ChangeNotifier {
  String ?email;
  String e = "basselprovider";
  String name = "basseil ismai provider";
  List List_of_product = [];
  dynamic price = 0;

  add(Item product) {
    List_of_product.add(product);
    price += product.price.round();
    notifyListeners(); // to Refresh for every click
  }
  remove(Item product){
    List_of_product.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}


// - Consumer<Prov>(builder: ((context, tester, child) {
// return ;
// })),
//
// -     final tester=Provider.of<Prov>(context);     (befor first return )
