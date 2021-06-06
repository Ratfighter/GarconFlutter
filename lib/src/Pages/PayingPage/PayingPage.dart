import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/PayingPageBody.dart';

class PayingPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(),
          Row(),
          Row(children: [PayingPageButton()],verticalDirection: VerticalDirection.down)
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