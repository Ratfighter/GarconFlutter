import 'package:flutter/material.dart';
import 'package:garcon/src/Styles/Colors.dart';

TextField garconLoginField(String textContent, {bool isPW = false, TextEditingController? txtController, bool hasAutoFocus = false}) {
  return TextField(
    controller: txtController,
    decoration: InputDecoration(
      labelText: textContent,
      labelStyle: TextStyle(color: primaryLightBlue.withOpacity(0.5)),
    ),
    enableSuggestions: !isPW,
    autocorrect: !isPW,
    obscureText: isPW,
    autofocus: hasAutoFocus,
  );
}

Text garconLogoText() {
  return Text(
    'Garcon-X',
    style: TextStyle(
      color: primaryLightBlue,
      fontSize: 35
    ),
  );
}