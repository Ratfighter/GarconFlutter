import 'dart:async';

import 'package:Garcon/src/Models/DataObjects/CartProduct.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../CurrentInstance.dart';
import 'PayingPageButton.dart';
import 'PayingPageItemList.dart';

class PayingPageBody extends StatefulWidget {
  final StreamController<int> cartController;

  const PayingPageBody(this.cartController);
  @override
  State<StatefulWidget> createState() => PayingPageBodyState(cartController);
}

class PayingPageBodyState extends State<PayingPageBody> {
  final StreamController<int> cartController;
  bool canPay = CurrentInstance.cartList.isNotEmpty;

  PayingPageBodyState(this.cartController);

  void refreshPage(CartProduct e)
  {
    setState(() {
      var cart = CurrentInstance.cartList;
      var lenght = cart.length;
      cart.remove(e);
      cartController.add(lenght - 1);
      canPay = cart.isNotEmpty;
    });
  }

  void payCart() => cartController.add(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: Container(
                child: PayingPageItemList(refreshPage),
                color: primaryLightGrey),
            flex: 10),
        Row(children: [Expanded(
            child: Container(
              child: PayingPageButton(payCart, canPay),
              color: primaryLightGrey,
            ))
        ])
      ],
    );
  }
}
