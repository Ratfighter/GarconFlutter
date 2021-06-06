import 'package:Garcon/src/Models/Entities/Config.dart';
import 'package:Garcon/src/Pages/Drawer/Components/MenuDrawerHeader.dart';
import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../SettingsPage/SettingsPage.dart';
import 'Components/MenuDrawerTile.dart';

class MenuDrawer extends StatefulWidget {
  @override
  MenuDrawerState createState() => MenuDrawerState();
}

class MenuDrawerState extends State<MenuDrawer> {
  String dateToString(DateTime date) {
    return '${date.year.toString()}.${date.month.toString()}.${date.day.toString()}. ${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<Config>('Config');
    var config = box.get('config')!;
    var openedDate = dateToString(config.dayopened!);
    return Drawer(
        child: Container(
          color: primaryDarkBlue,
          child: ListView(padding: EdgeInsets.zero, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MenuDrawerHeader(config.ClientName, config.TenantName, openedDate),
                MenuDrawerTile(
                    Icons.settings_sharp,
                    'Beállítások',
                        () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return SettingsPage();
                          }))
                    }),
                MenuDrawerTile(Icons.logout_sharp, 'Kijelentkezés',
                        () => {Navigator.pop(context)})
              ],
            ),
          ]),
        ));
  }
}
