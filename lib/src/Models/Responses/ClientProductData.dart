import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProductGroup.dart';

class ClientProductData{
  final List<ClientProductGroup> productGroups;
  final List<ClientProduct> products;

  ClientProductData(this.productGroups, this.products);
}