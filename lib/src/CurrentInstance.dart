import 'package:Garcon/src/Models/DataObjects/ClientProduct.dart';
import 'package:Garcon/src/Models/DataObjects/ClientProductGroup.dart';

import 'Models/DataObjects/CartProduct.dart';
import 'Models/Entities/Config.dart';
import 'Models/Entities/Settings.dart';

class CurrentInstance{
  static Settings currentSettings = new Settings(false, false, true, false, 50);
  static Config? currentConfiguration;
  static List<ClientProductGroup> productGroupsList = List.empty();
  static List<ClientProduct> productList = List.empty();
  static List<CartProduct> cartList = List.empty();
}