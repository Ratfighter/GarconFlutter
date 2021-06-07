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
  StreamController<int> cartController;
  PayingPageButton(this.cartController);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ElevatedButton(
            child: Text(
              'Fizetés',
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
            onPressed: () async => startPayment(context)
        ),
      ),
    );
  }

  Future<void> startPayment(BuildContext context) async
  {
    var cart = CurrentInstance.cartList;
    if(cart.isEmpty)
    {
      showDialog(context: context, builder: (builder){
        return AlertDialog(
          content: Text('Nincs termék a kosárban!'),
        );
      });
      return;
    }
    var config = CurrentInstance.currentConfiguration!;
    var paymentList = List<EHPaymentItem>.empty(growable: true);
    var productList = List<SaleProduct>.empty(growable: true);
    var cost = 0.0;
    cart.forEach((element) {

      var salePrice = element.originalUnitPrice *
          (1 - (element.discountPercentage / 100));
      cost += salePrice;
      var vatValue = salePrice * (element.vatPercentage / 100);
      productList.add(new SaleProduct(
          null,
          null,
          element.productID,
          element.quantity,
          element.originalUnitPrice,
          salePrice,
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
    PublishData pubdata = new PublishData(
        data,
        PublishDataType.InstantSale,
        config.TenantName,
        config.storageID,
        config.clientID,
        3);
    var success = await sendInstantSale(pubdata);
    if (success) {
      CurrentInstance.cartList.clear();
      cartController.add(0);
      Navigator.pop(context);
    } else {
      showDialog(context: context, builder: (builder){
        return AlertDialog(
          content: Text('Fizetés sikertelen!'),
        );
      });
    }
  }
}
