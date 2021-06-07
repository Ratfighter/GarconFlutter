import 'dart:async';

import 'package:Garcon/src/Controllers/ApiRequestController.dart';
import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Pages/Drawer/Drawer.dart';
import 'package:Garcon/src/Pages/PayingPage/PayingPage.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'Components/InstantSaleBody.dart';

// ignore: must_be_immutable
class InstantSalePage extends StatefulWidget {
  final StreamController<bool> loginController;

  const InstantSalePage(this.loginController);

  @override
  InstantSalePageState createState() => InstantSalePageState(loginController);
}

class InstantSalePageState extends State<InstantSalePage> {
  final StreamController<int> cartController = new StreamController<int>.broadcast();
  final StreamController<bool> loginController;

  InstantSalePageState(this.loginController);
  int productCount = 0;

  @override
  void dispose() {
    cartController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var stream = cartController.stream.asBroadcastStream();
    stream.listen((value) {
      setState(() {
        productCount = value;
      });
    });
  }

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
        body: InstantSaleBody(cartController),
      drawer: MenuDrawer(loginController),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (builder){
            return PayingPage(cartController);
          }));
        },
        label: Text(productCount.toString(), style: TextStyle(color: Colors.black)),
        icon : Icon(Icons.shopping_cart_sharp, color: Colors.black),
        foregroundColor: Colors.black12,
      )
    );
  }
}
