import 'package:Garcon/src/Pages/SettingsPage/Components/SettingsSaveButton.dart';
import 'package:flutter/cupertino.dart';

class SettingsBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SettingsBodyState();

}

class SettingsBodyState extends State<SettingsBody>
{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(),
        Row(),
        Row(children: [SettingsSaveButton()],verticalDirection: VerticalDirection.down)
      ],
    );
  }
  
}