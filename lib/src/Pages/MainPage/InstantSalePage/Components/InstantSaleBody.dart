import 'dart:async';

import 'package:Garcon/src/Controllers/ApiRequestController.dart';
import 'package:Garcon/src/Models/Responses/ClientProductData.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../CurrentInstance.dart';
import 'InstantSaleItemList.dart';

class InstantSaleBody extends StatefulWidget {
  final StreamController<int> cartController;

  const InstantSaleBody(this.cartController);

  @override
  State<StatefulWidget> createState() => InstantSaleBodyState(cartController);
}

class InstantSaleBodyState extends State<InstantSaleBody> {
  late Future<ClientProductData> data;
  final StreamController<int> cartController;

  InstantSaleBodyState(this.cartController);

  @override
  void initState() {
    super.initState();
    data = ApiRequestController.requestClientObjects(CurrentInstance.currentConfiguration!.token);
  }

  @override
  Widget build(BuildContext context) {
    return listProductGroups();
  }

  Column listProductGroups() {
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
                  return InstantSaleItemList(data, cartController);
                }
                return ListView();
              },
            )))
      ],
    );
  }
}
