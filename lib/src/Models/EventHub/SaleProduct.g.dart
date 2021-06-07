// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaleProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleProduct _$SaleProductFromJson(Map<String, dynamic> json) {
  return SaleProduct(
    json['ToSaleItemID'] as int?,
    json['FromSaleItemID'] as int?,
    json['ProductID'] as int,
    (json['Quantity'] as num).toDouble(),
    (json['OriginalPrice'] as num).toDouble(),
    (json['SalePrice'] as num).toDouble(),
    (json['VatPercent'] as num).toDouble(),
    (json['VatValue'] as num).toDouble(),
    (json['DiscountPercentage'] as num).toDouble(),
  );
}

Map<String, dynamic> _$SaleProductToJson(SaleProduct instance) =>
    <String, dynamic>{
      'ToSaleItemID': instance.toSaleItemID,
      'FromSaleItemID': instance.fromSaleItemID,
      'ProductID': instance.productID,
      'Quantity': instance.quantity,
      'OriginalPrice': instance.originalPrice,
      'SalePrice': instance.salePrice,
      'VatPercent': instance.vatPercent,
      'VatValue': instance.vatValue,
      'DiscountPercentage': instance.discountPercentage,
    };
