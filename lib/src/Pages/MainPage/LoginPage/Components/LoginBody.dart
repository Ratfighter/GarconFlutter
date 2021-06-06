import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginButton.dart';
import 'LoginLogo.dart';
import 'LoginTextField.dart';

class LoginBody extends StatefulWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tenantController = TextEditingController();
  final TextEditingController clientController = TextEditingController();
  final StreamController<bool> loginController;

  LoginBody(this.loginController);

  @override
  LoginBodyState createState() => LoginBodyState(passwordController,tenantController,clientController,loginController);
}

class LoginBodyState extends State<LoginBody> {
  final TextEditingController passwordController;
  final TextEditingController tenantController;
  final TextEditingController clientController;
  final StreamController<bool> loginController;
  LoginBodyState(this.passwordController,this.tenantController,this.clientController,this.loginController);

  @override
  void dispose() {
    passwordController.dispose();
    tenantController.dispose();
    clientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(children: [
          LoginLogo(),
          LoginTextField('Előfizetés', hasAutoFocus: true, txtController: tenantController),
          LoginTextField('Kliensnév', txtController: clientController),
          LoginTextField('Validációs kód', isPW: true, txtController: passwordController),
          LoginButton(loginController, tenantController, clientController, passwordController)
        ], mainAxisAlignment: MainAxisAlignment.center,),
      ),
    );
  }
}
