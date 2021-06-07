import 'dart:async';

import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/PayingPageBody.dart';
import 'Components/PayingPageButton.dart';

class PayingPage extends StatelessWidget
{
  StreamController<int> cartController;
  PayingPage(this.cartController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: PayingPageBody(cartController)),
      appBar: AppBar(
        backgroundColor: primaryDarkBlue,
        iconTheme: IconThemeData(
            color: primaryLightBlue
        ),
        title: Text(
          'Kosár',
          style: TextStyle(
              color: primaryLightBlue,
              fontSize: 35,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}