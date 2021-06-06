import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDrawerTile extends StatelessWidget
{
  final IconData icon;
  final String txt;
  final VoidCallback func;
  MenuDrawerTile(this.icon,this.txt,this.func);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: this.func,
        trailing: Icon(
          this.icon,
          color: primaryLightBlue,
        ),
        title: Text(this.txt,style: TextStyle(color: primaryLightBlue),)
    );
  }

}