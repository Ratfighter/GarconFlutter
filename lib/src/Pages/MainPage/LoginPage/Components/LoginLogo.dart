import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';

class LoginLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'Garcon',
          style: TextStyle(
              color: primaryLightBlue,
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
      ),
      flex: 2,
    );
  }

}