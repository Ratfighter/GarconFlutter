import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/Entities/Config.dart';
import 'package:Garcon/src/Models/Entities/Settings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/Pages/MainPage/MainPage.dart';
import 'src/Styles/Colors.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ConfigAdapter());
  Hive.registerAdapter(SettingsAdapter());
  var settingBox = await Hive.openBox<Settings>('Settings');
  var configBox = await Hive.openBox<Config>('Config');
  if (settingBox.isEmpty) {
    settingBox.put('setting', CurrentInstance.currentSettings);
  }
  if (configBox.isNotEmpty) {
    CurrentInstance.currentConfiguration = configBox.get('config');
  }
  runApp(MaterialApp(
      title: 'Garcon',
      theme: ThemeData(
          primaryColor: primaryLightBlue,
          backgroundColor: primaryDarkBlue,
          fontFamily: 'Poppins'),
      home: MainPage()));
}
