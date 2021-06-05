import 'dart:convert';

import 'package:garcon/src/Models/Requests/LoginRequest.dart';
import 'package:http/http.dart' as http;

final apiurl = 'https://prod-app-minibizz-api-01.azurewebsites.net/';
final client = http.Client();

Future<http.Response> sendLogin(LoginRequest req) async {
  var jsonBody = jsonEncode(req.toJson());
  var result = await client.post(Uri.parse('$apiurl/Login/ClientLogin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody);
  return result;
}
