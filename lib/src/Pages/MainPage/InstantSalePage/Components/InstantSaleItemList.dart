
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
  const InstantSaleItemList(this.data);

  @override
  Widget build(BuildContext context) {
   return ListView(
     children: List.from(
         data.productGroups.where((element) => data.products.any((x) => x.productGroupId == element.id)).map((product) => InstantSaleProductGroup(product))
     ),
   );
  }

}


class InstantSaleProductGroup extends StatelessWidget
{
  final ClientProductGroup group;
  InstantSaleProductGroup(this.group);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(group.name),
      tileColor: HexColor.fromHex(group.color),
      onTap: () {
        List<ClientProduct> productList = CurrentInstance.productList.where((element) => element.productGroupId == group.id).toList();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return InstantSaleSubItemList(productList);
            }));
      },
    );
  }
}