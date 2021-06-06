import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/SettingsBody.dart';

class SettingsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SettingsPageState();
  
}

class SettingsPageState extends State<SettingsPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsBody(),
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