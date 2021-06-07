import 'dart:async';

import 'package:Garcon/src/Controllers/EventHubController.dart';
import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/EventHub/Enums.dart';
import 'package:Garcon/src/Models/EventHub/PaymentItem.dart';
import 'package:Garcon/src/Models/EventHub/PublishData.dart';
import 'package:Garcon/src/Models/EventHub/SaleProduct.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PayingPageButton extends StatelessWidget {
  final void Function() func;
  final bool canPay;
  PayingPageButton(this.func, this.canPay);

  @override
  Widget build(BuildContext context) {
    double cost = 0.0;
    CurrentInstance.cartList.forEach((element) {
      var saleprice = element.quantity*element.originalUnitPrice*(1-(element.discountPercentage/100));
      cost += saleprice;
    });
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ElevatedButton(
          child: Text(
            canPay ? '$cost Ft Fizetése' : 'Fizetés nem elérhető',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.normal),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: primaryDarkBlue))),
              foregroundColor:
                  MaterialStateProperty.all<Color>(primaryLightBlue)),
          onPressed: canPay ? () async => startPayment(context) : null),
    );
  }

  Future<void> startPayment(BuildContext context) async {
    var cart = CurrentInstance.cartList;
    var config = CurrentInstance.currentConfiguration!;
    var paymentList = List<EHPaymentItem>.empty(growable: true);
    var productList = List<SaleProduct>.empty(growable: true);
    var cost = 0.0;
    cart.forEach((element) {
      var salePrice = element.originalUnitPrice * (1 - (element.discountPercentage / 100));
      cost += salePrice * element.quantity;
      var vatValue = salePrice * (element.vatPercentage / 100);
      productList.add(new SaleProduct(
          null,
          null,
          element.productID,
          element.quantity,
          salePrice,
          element.originalUnitPrice,
          element.vatPercentage,
          vatValue,
          element.discountPercentage));
    });
    paymentList.add(new EHPaymentItem(PublisherPaymentTypeEnum.cash, cost));
    var data = new Data(
        Uuid().v4(),
        DateTime.now().toUtc(),
        DateTime.now().toUtc(),
        0.0,
        0.0,
        0.0,
        0.0,
        paymentList,
        productList,
        "",
        "",
        "");
    var type = PublishDataType.InstantSale;
    PublishData pubdata = new PublishData(data, type, config.TenantName, config.clientID, config.storageID, 3);
    var success = await sendInstantSale(pubdata);
    if (success) {
      CurrentInstance.cartList.clear();
      func.call();
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (builder) {
            return AlertDialog(
              content: Text('Fizetés sikertelen!'),
            );
          });
    }
  }
}
