import 'package:Garcon/src/Models/DataObjects/CartProduct.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayingPageItem extends StatelessWidget
{
  final CartProduct cartProduct;
  final void Function(CartProduct) function;

  const PayingPageItem(this.cartProduct,this.function);

  @override
  Widget build(BuildContext context) {
    var saleprice = cartProduct.originalUnitPrice*(1-(cartProduct.discountPercentage/100));
    return Container(
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: HexColor.fromHex(cartProduct.color),
                    width: 12
                ),
                top: BorderSide(
                    color: Colors.black12
                ),
                bottom: BorderSide(
                  color: Colors.black12,
                )
            )
        ),
        child: ListTile(
          title: Text(cartProduct.name),
          subtitle: Text('Ár: $saleprice Ft'),
          trailing: Text('Mennyiség: ${cartProduct.quantity.toInt()}'),
          tileColor: primaryLightGrey,
          onTap: () => function.call(cartProduct)
        )
    );
  }

}