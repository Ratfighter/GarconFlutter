import 'dart:async';

import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/DataObjects/CartProduct.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProductGroup.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstantSaleSubItemList extends StatefulWidget {
  InstantSaleSubItemList(this.products, this.group,this.cartController);

  final List<ClientProduct> products;
  final ClientProductGroup group;
  final StreamController<int> cartController;

  @override
  State<StatefulWidget> createState() => InstantSaleSubItemListState(this.products,this.group,this.cartController);


}

class InstantSaleSubItemListState extends State<InstantSaleSubItemList>
{
  final List<ClientProduct> products;
  final ClientProductGroup group;
  final StreamController<int> cartController;

  InstantSaleSubItemListState(this.products,this.group,this.cartController);

  void addToCart() => cartController.add(CurrentInstance.cartList.length);
  @override
  Widget build(BuildContext context) {
    var color = HexColor.fromHex(group.color);
    return Scaffold(
        appBar: AppBar(
          title: Text(group.name),
          backgroundColor: color,
        ),
        backgroundColor: primaryLightGrey,
        body: ListView(
            children: List<Widget>.from(
                products.map((product) => InstantSaleSubItem(product, addToCart)))));
  }
}

class InstantSaleSubItem extends StatefulWidget {
  final ClientProduct product;
  final void Function() func;
  const InstantSaleSubItem(this.product,this.func);

  @override
  State<StatefulWidget> createState() => InstantSaleSubItemState(product,func);
}

class InstantSaleSubItemState extends State<InstantSaleSubItem>
{
  final TextEditingController txtController = new TextEditingController(text: '1');
  final ClientProduct product;
  final void Function() func;
  int inCart = 0;

  InstantSaleSubItemState(this.product, this.func);

  @override
  void dispose() {
    txtController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    CurrentInstance.cartList.where((element) => element.productID == product.id).forEach((element) { inCart += element.quantity.toInt(); });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var saleprice = product.price;
    return Container(
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(color: HexColor.fromHex(product.color), width: 12),
                top: BorderSide(color: Colors.black12),
                bottom: BorderSide(
                  color: Colors.black12,
                ))),
        child: ListTile(
          title: Text(product.name),
          subtitle: Text('Ár: $saleprice Ft'),
          trailing: inCart != 0 ? Text('Kosárban: $inCart') : null,
          tileColor: primaryLightGrey,
          onTap: () async {
            await alertDialog(context, txtController, func, product);
          },
        )
    );
  }

  CartProduct? firstOrNull(
      List<CartProduct> cart, bool Function(CartProduct) func) {
    CartProduct? product;
    for (var i = 0; i < cart.length; i++) {
      if (func.call(cart[i])) {
        product = cart[i];
      }
    }
    return product;
  }

  int maxLineID(List<CartProduct> cart) {
    int maxLineID = 1;
    for (var i = 0; i < cart.length; i++) {
      if (maxLineID < cart[i].lineID) {
        maxLineID = cart[i].lineID;
      }
    }
    return maxLineID;
  }

  Future<void> alertDialog(BuildContext context, TextEditingController txtController, void Function() func,
      ClientProduct product) async{
    var alert = AlertDialog(
        title: Text('Mennyiség'),
        content: Container(
          height: 100,
          child: Column(children: [
            TextField(
              controller: txtController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () {
                  var text = txtController.text;
                  double quantity = double.parse(text);
                  setState(() {
                    inCart += quantity.toInt();
                  });
                  var cart = CurrentInstance.cartList;
                  if (CurrentInstance.currentSettings.enableProductGrouping) {
                    CartProduct? cartprod = firstOrNull(
                        cart, (element) => element.productID == product.id);
                    if (cartprod != null) {
                      cartprod.quantity += quantity;
                      Navigator.pop(context);
                      return;
                    }
                  }
                  var lineID = maxLineID(cart);
                  var newcartproduct = new CartProduct(lineID, product.color, product.name, 0,
                      product.id, quantity, product.price, product.vatPercent);
                  cart.add(newcartproduct);
                  func.call();
                  Navigator.pop(context);
                },
                child: Text('Hozzáadás'))
          ]),
        ));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
