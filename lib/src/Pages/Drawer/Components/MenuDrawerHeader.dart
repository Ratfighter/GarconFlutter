import 'package:Garcon/src/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDrawerHeader extends StatelessWidget {
  final String tenantName;
  final String clientName;
  final String openedDate;
  final TextStyle textformat =
      TextStyle(fontWeight: FontWeight.bold, color: primaryLightBlue);
  MenuDrawerHeader(this.clientName, this.tenantName, this.openedDate);
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(color: primaryDarkBlue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Utolsó napnyitás: $openedDate',
              style: textformat,
            ),
            Text(
              '$tenantName : $clientName',
              style: textformat,
            )
          ],
        ));
  }
}
