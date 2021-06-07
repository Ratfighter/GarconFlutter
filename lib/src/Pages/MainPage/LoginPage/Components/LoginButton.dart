import 'dart:async';
import 'dart:convert';

import 'package:Garcon/src/Controllers/ApiRequestController.dart';
import 'package:Garcon/src/Models/Entities/Config.dart';
import 'package:Garcon/src/Models/Requests/LoginRequest.dart';
import 'package:Garcon/src/Models/Responses/LoginResponse.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoginButton extends StatelessWidget {
  final StreamController<bool> loginController;
  final TextEditingController tenantController;
  final TextEditingController clientController;
  final TextEditingController passwordController;

  LoginButton(this.loginController, this.tenantController,
      this.clientController, this.passwordController);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ElevatedButton(
            child: Text(
              'Bejelentkezés',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: primaryDarkBlue))),
                foregroundColor:
                    MaterialStateProperty.all<Color>(primaryLightBlue)),
            onPressed: () async => await processLogin(context),
      ),
    ));
  }

  Future<void> processLogin(BuildContext context) async {
    {
      var tenant = tenantController.text;
      var client = clientController.text;
      var code = passwordController.text;
      LoginRequest req = new LoginRequest(code, client, tenant);
      var response = await ApiRequestController.sendLogin(req);
      switch (response.statusCode) {
        case 200:
          //Route az instant sale page-re
          var json = jsonDecode(response.body);
          var obj = LoginResponse.fromJson(json);
          var box = Hive.box<Config>('Config');
          box.put(
              'config',
              new Config(obj.token, obj.clientid, obj.until, obj.dayopened,
                  obj.apiname, obj.storageid, tenant, client));
          loginController.add(true);
          return;
        case 400:
          await showAlertDialog(context, 'Érvénytelen felhasználónév vagy jelszó!');
          return;
        default:
          await showAlertDialog(context, 'Hiba történt a bejelentkezés során!${response.body}');
          return;
          //Dialog hiba esetén

      }
    }
  }

  Future<void> showAlertDialog(BuildContext context, String text) async
  {
    await showDialog(
        context: context,
        builder: (context) {
      return AlertDialog(
          content: Text(
              '$text'));
    });
  }
}
