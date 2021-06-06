class ClientProduct
{
  final int id;
  final String name;
  final double vatPercent;
  final double? secondaryVatPercent;
  final String? barcode;
  final String color;
  final double price;
  final bool isDiscountable ;
  final List<int> wrappingIDs ;
  final String unit;
  final int printerId;
  final int productGroupId ;
  final String? parentProduct;
  final int parentProductID;
  final bool hasChild;

  ClientProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        vatPercent = json['vatPercent'],
        secondaryVatPercent = json['secondaryVatPercent'],
        barcode = json['barcode'],
        color = json['color'],
        price = json['price'],
        isDiscountable = json['isDiscountable'],
        wrappingIDs = List.from(json['wrappingIDs']),
        unit = json['unit'],
        printerId = json['printerId'],
        productGroupId = json['productGroupId'],
        parentProduct = json['parentProduct'],
        parentProductID = json['parentProductID'],
        hasChild = json['hasChild'];
}