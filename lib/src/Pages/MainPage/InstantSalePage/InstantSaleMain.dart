import 'package:Garcon/src/Controllers/ApiRequestController.dart';
import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Pages/Drawer/Drawer.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'Components/InstantSaleBody.dart';

// ignore: must_be_immutable
class InstantSalePage extends StatefulWidget {
  @override
  InstantSalePageState createState() => InstantSalePageState();
}

class InstantSalePageState extends State<InstantSalePage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryDarkBlue,
          iconTheme: IconThemeData(
            color: primaryLightBlue
          ),
          title: Text(
            'Garcon',
            style: TextStyle(
                color: primaryLightBlue,
                fontSize: 35,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: InstantSaleBody(),
      drawer: MenuDrawer(),
    );
  }
}
