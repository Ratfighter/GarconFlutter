import 'package:json_annotation/json_annotation.dart';

part 'SaleProduct.g.dart';

@JsonSerializable()
class SaleProduct {
  final int? toSaleItemID;
  final int? fromSaleItemID;
  final int productID;
  final double quantity;
  final double originalPrice;
  final double salePrice;
  final double vatPercent;
  final double vatValue;
  final double discountPercentage;

  SaleProduct(this.toSaleItemID, this.fromSaleItemID, this.productID, this.quantity, this.originalPrice, this.salePrice, this.vatPercent, this.vatValue, this.discountPercentage);

  factory SaleProduct.fromJson(Map<String, dynamic> json) =>
      _$SaleProductFromJson(json);
  Map<String, dynamic> toJson() => _$SaleProductToJson(this);
}
