import 'package:flutter/material.dart';
import 'package:garcon/src/Styles/Colors.dart';

import 'components/LoginBody.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
      backgroundColor: primaryDarkBlue,
    );
  }
}
