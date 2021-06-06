import 'dart:async';

import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/material.dart';

import 'Components/LoginBody.dart';

class LoginPage extends StatelessWidget {
  LoginPage(this.loginController);
  final StreamController<bool> loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(loginController),
      backgroundColor: primaryDarkBlue,
    );
  }
}
