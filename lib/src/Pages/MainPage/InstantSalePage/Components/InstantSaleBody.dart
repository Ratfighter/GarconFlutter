import 'package:Garcon/src/Controllers/ApiRequestController.dart';
import 'package:Garcon/src/Models/Responses/ClientProductData.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../CurrentInstance.dart';
import 'InstantSaleItemList.dart';

class InstantSaleBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InstantSaleBodyState();
}

class InstantSaleBodyState extends State<InstantSaleBody> {
  late Future<ClientProductData> data;

  @override
  void initState() {
    super.initState();
    data = requestProducts(CurrentInstance.currentConfiguration!.token);
  }

  @override
  Widget build(BuildContext context) {
    return listProductGroups();
  }

  Column listProductGroups()
  {
    return Column(
      children: [
        Expanded(
            flex: 10,
            child: Container(
              child: FutureBuilder<ClientProductData>(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ListView();
                  } else if (snapshot.hasData) {
                    ClientProductData data = snapshot.data!;
                    return InstantSaleItemList(data);
                  }
                  return ListView();
                },
              )
            )),
        Expanded(
          flex: 1,
          child: ListTile(
            onTap: () {

            },
            tileColor: primaryLightGrey,
            title: Text('Számla'),
            trailing: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.black,
            ),
          )
        )
      ],
    );
  }
}
