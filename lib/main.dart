import 'package:flutter/material.dart';

import 'src/Pages/LoginPage/LoginMain.dart';
import 'src/Styles/Colors.dart';

void main() {
  final page = LoginPage();
  runApp(MaterialApp(
    title: 'Garcon',
    theme: ThemeData(
        primaryColor: primaryLightBlue,
        backgroundColor: primaryDarkBlue,
        fontFamily: 'Poppins'),
    initialRoute: '/Login',
    routes: {
      '/Login': (context) => LoginPage(),
      '/': (context) => AlertDialog(content: Text('This doesnt exist!'))
    },
  ));
}
