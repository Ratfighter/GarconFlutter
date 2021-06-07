import 'dart:convert';

import 'package:Garcon/src/Controllers/ApiRequestController.dart';
import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/EventHub/PublishData.dart';

//const String EventHUBURL = 'https://prod-evh-namespace-minibizz.servicebus.windows.net/prod-evh-minibizz/messages';
const String EventHUBURL = 'https://prod-app-minibizz-api-01.azurewebsites.net/Queue/Add';

Future<bool> sendInstantSale(PublishData data) async
{
  var sas = CurrentInstance.currentConfiguration!.token;
  var client = ApiRequestController.client;
  var json = data.toJson();
  var jsonBody = jsonEncode(json);
  var result = await client.post(Uri.parse('$EventHUBURL'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'ClientAuthorization': sas
      },
      body: jsonBody);
  return result.statusCode == 200;
}