import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayingPageButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ElevatedButton(
            child: Text(
              'Fizetés',
              style: TextStyle(
                  color: Colors.black, fontSize: 24, fontWeight: FontWeight.normal),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: primaryDarkBlue))),
                foregroundColor:
                MaterialStateProperty.all<Color>(primaryLightBlue)),
            onPressed: () async {
              //TODO fizetés elküldése
            }),
      ),
    );
  }
}