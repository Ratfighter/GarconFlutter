import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget{
  final textContent;
  final isPW;
  final hasAutoFocus;
  final txtController;

  LoginTextField(this.textContent,{this.isPW = false,this.txtController,this.hasAutoFocus = false});

  @override
  Widget build(BuildContext context) {
      return Expanded(
        flex: 1,
        child: TextField(
          controller: txtController,
          decoration: InputDecoration(
              labelText: textContent,
              labelStyle: TextStyle(color: primaryLightBlue.withOpacity(0.5)),
              fillColor: primaryDarkBlue,
              filled: true),
          enableSuggestions: !isPW,
          autocorrect: !isPW,
          obscureText: isPW,
          autofocus: hasAutoFocus,
          style: TextStyle(color: primaryLightBlue),
        ),
      );
  }

}
