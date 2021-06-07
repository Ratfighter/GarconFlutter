import 'dart:async';

import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/DataObjects/CartProduct.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PayingPageItem.dart';

class PayingPageItemList extends StatelessWidget {
  final void Function(CartProduct) func;

  PayingPageItemList(this.func);

  @override
  Widget build(BuildContext context) {
    var cart = CurrentInstance.cartList;
    var listtiles = List<Widget>.from(cart.map((e) => PayingPageItem(
        e,func)));
    if (listtiles.isEmpty) {
      return Row(children: [
        Expanded(child: Center(child: Text('Üres a kosár!', style: TextStyle(fontSize: 30))))
      ]);
    }
    return ListView(children: listtiles);
  }
}
