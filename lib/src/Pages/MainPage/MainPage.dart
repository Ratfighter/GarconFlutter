import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../CurrentInstance.dart';
import 'InstantSalePage/InstantSaleMain.dart';
import 'LoginPage/LoginMain.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  late Stream<bool> loginstream;
  late StreamController<bool> controller;
  MainPageState() {
    this.controller = new StreamController();
    this.loginstream = controller.stream;
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: loginstream,
        initialData: CurrentInstance.currentConfiguration != null,
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            bool isLoggedIn = snapshot.data!;
            if (isLoggedIn) {
              return InstantSalePage();
            }
          }
          return LoginPage(controller);
        });
  }
}
