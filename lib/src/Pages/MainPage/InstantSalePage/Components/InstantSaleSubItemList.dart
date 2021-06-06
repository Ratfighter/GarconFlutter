import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/DataObjects/CartProduct.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstantSaleSubItemList extends StatelessWidget {
  InstantSaleSubItemList(this.products);

  final List<ClientProduct> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          children: List<Widget>.from(products.map((product) => InstantSaleSubItem(product)))
        )
      ],
    );
  }
}

class InstantSaleSubItem extends StatelessWidget {
  final ClientProduct product;

  const InstantSaleSubItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      tileColor: HexColor.fromHex(product.color).withOpacity(0.5),
      onTap: () async {
        TextEditingController txtController = new TextEditingController();
        txtController.text = '1';
        AlertDialog(
            title: Text('Mennyiség'),
            content: Column(children: [
              TextField(
                controller: txtController,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: () {
                    int quantity = int.parse(txtController.text);
                    txtController.dispose();
                    var cart = CurrentInstance.cartList;
                    if (CurrentInstance.currentSettings.enableProductGrouping) {
                      CartProduct? cartprod = firstOrNull(
                          cart, (element) => element.productID == product.id);
                      if (cartprod != null) {
                        cartprod.quantity += quantity;
                        return;
                      }
                    }
                    var lineID = maxLineID(cart);
                    cart.add(new CartProduct(
                        lineID, product.color, product.name, 0, product.id, quantity));
                  },
                  child: Text('Hozzáadás'))
            ]));
      },
    );
  }
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
