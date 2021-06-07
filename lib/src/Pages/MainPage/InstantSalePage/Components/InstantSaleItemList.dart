
import 'dart:async';

import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProductGroup.dart';
import 'package:Garcon/src/Models/Responses/ClientProductData.dart';
import 'package:Garcon/src/Pages/MainPage/InstantSalePage/Components/InstantSaleSubItemList.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/material.dart';

class InstantSaleItemList extends StatelessWidget
{
  final ClientProductData data;
  final StreamController<int> cartController;
  const InstantSaleItemList(this.data,this.cartController);

  @override
  Widget build(BuildContext context) {
   return ListView(
     children: List.from(
         data.productGroups.where((element) => data.products.any((x) => x.productGroupId == element.id)).map((product) => InstantSaleProductGroup(product, cartController))
     ),
   );
  }

}


class InstantSaleProductGroup extends StatelessWidget
{
  final ClientProductGroup group;
  final StreamController<int> cartController;
  InstantSaleProductGroup(this.group,this.cartController);

  @override
  Widget build(BuildContext context) {
    var elementCount = CurrentInstance.productList.where((element) => element.productGroupId == group.id).length;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: HexColor.fromHex(group.color),
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
        title: Text(group.name),
        subtitle: Text('Termékek: $elementCount'),
        tileColor: primaryLightGrey,
        onTap: () {
          List<ClientProduct> productList = CurrentInstance.productList.where((element) => element.productGroupId == group.id).toList();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return InstantSaleSubItemList(productList, group, cartController);
              }));
        },
      )
    );
  }
}