import 'dart:async';

import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/PayingPageButton.dart';

class PayingPage extends StatelessWidget
{
  StreamController<int> cartController;
  PayingPage(this.cartController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(),
          Row(),
          Row(children: [PayingPageButton(cartController)],verticalDirection: VerticalDirection.down)
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryDarkBlue,
        iconTheme: IconThemeData(
            color: primaryLightBlue
        ),
        title: Text(
          'Beállítások',
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