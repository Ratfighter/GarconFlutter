import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garcon/src/Controllers/ApiRequestController.dart';
import 'package:garcon/src/Models/Requests/LoginRequest.dart';
import 'package:garcon/src/Pages/LoginPage/components/LoginWidgets.dart';
import 'package:garcon/src/Styles/Colors.dart';

class LoginBody extends StatefulWidget {
  final passwordController = TextEditingController();
  final tenantController = TextEditingController();
  final clientController = TextEditingController();

  @override
  @override
  LoginBodyState createState() => LoginBodyState(passwordController,tenantController,clientController);
}

class LoginBodyState extends State<LoginBody> {
  final passwordController;
  final tenantController;
  final clientController;
  LoginBodyState(this.passwordController,this.tenantController,this.clientController);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        garconLogoText(),
        garconLoginField('Előfizetés', hasAutoFocus: true, txtController: tenantController),
        garconLoginField('Kliensnév', txtController: clientController),
        garconLoginField('Validációs kód', isPW: true, txtController: passwordController),
        ElevatedButton(
            child: Text(
              'Bejelentkezés',
              style: TextStyle(
                  color: primaryDarkBlue, fontSize: 24, fontFamily: ''),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: primaryDarkBlue))),
                foregroundColor:
                    MaterialStateProperty.all<Color>(primaryLightBlue)),
            onPressed: () async {
              var tenant = tenantController.text;
              var client = clientController.text;
              var code = passwordController.text;
              LoginRequest req = new LoginRequest(code, client, tenant);
              var resbody = await sendLogin(req);
              switch(resbody.statusCode)
              {
                case 200:
                  //Route az instant sale page-re
                  return;
                case 400:
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(content: Text(
                            'Érvénytelen felhasználónév vagy jelszó!'));
                      });
                  return;
                default:
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(content: Text(
                            'Hiba történt a bejelentkezés során!${resbody.body}'));
                      });
              }
            })
      ], mainAxisSize: MainAxisSize.min),
    );
  }
}
