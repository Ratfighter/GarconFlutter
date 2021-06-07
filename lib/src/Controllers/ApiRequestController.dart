import 'dart:convert';

import 'package:Garcon/src/CurrentInstance.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProductGroup.dart';
import 'package:Garcon/src/Models/Requests/LoginRequest.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Models/Responses/ClientProductData.dart';
import 'package:http/http.dart' as http;

class ApiRequestController{
  static const apiurl = 'https://prod-app-minibizz-api-01.azurewebsites.net';
  static final client = http.Client();

  static Future<http.Response> sendLogin(LoginRequest req) async {
    var jsonBody = jsonEncode(req.toJson());
    var result = await client.post(Uri.parse('$apiurl/Login/ClientLogin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody);
    return result;
  }

  static Future<ClientProductData> requestClientObjects(String jwt) async {
    var prods = await requestProductList(jwt);
    var groups = await requestProductGroups(jwt);
    if (prods.statusCode == 200 && groups.statusCode == 200) {
      Iterable iter1 = jsonDecode(prods.body);
      Iterable iter2 = jsonDecode(groups.body);
      CurrentInstance.productList = List<ClientProduct>.from(iter1.map((e) => ClientProduct.fromJson(e)));
      CurrentInstance.productGroupsList = List<ClientProductGroup>.from(iter2.map((e) => ClientProductGroup.fromJson(e)));
      ClientProductData data = new ClientProductData(CurrentInstance.productGroupsList, CurrentInstance.productList);
      return data;
    } else {
      throw Exception("Request Failed");
    }
  }

  static Future<http.Response> requestProductList(String jwt) async {
    var result = await client.get(Uri.parse('$apiurl/Product/ClientProductList'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'ClientAuthorization': '$jwt'
        });
    return result;
  }

  static Future<http.Response> requestProductGroups(String jwt) async {
    var result = await client.get(
        Uri.parse('$apiurl/ProductGroup/ClientProductGroupList'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'ClientAuthorization': '$jwt'
        });
    return result;
  }
}