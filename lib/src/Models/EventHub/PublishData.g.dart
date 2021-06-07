// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PublishData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishData _$PublishDataFromJson(Map<String, dynamic> json) {
  return PublishData(
    Data.fromJson(json['data'] as Map<String, dynamic>),
    json['Type'] as int,
    json['TenantName'] as String,
    json['ClientID'] as int,
    json['StorageID'] as int,
    json['UserID'] as int,
  );
}

Map<String, dynamic> _$PublishDataToJson(PublishData instance) =>
    <String, dynamic>{
      'Data': instance.data.toJson(),
      'Type': instance.type,
      'TenantName': instance.tenantName,
      'ClientID': instance.clientID,
      'StorageID': instance.storageID,
      'UserID': instance.userID,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['SaleGuid'] as String,
    DateTime.parse(json['createdOn'] as String),
    DateTime.parse(json['paidOn'] as String),
    (json['ServiceFee'] as num).toDouble(),
    (json['ServiceFeePercentage'] as num).toDouble(),
    (json['DiscountPercentage'] as num).toDouble(),
    (json['Discount'] as num).toDouble(),
    (json['PaymentList'] as List<dynamic>)
        .map((e) => EHPaymentItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['ProductList'] as List<dynamic>)
        .map((e) => SaleProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['APNUM'] as String?,
    json['CLNUM'] as String?,
    json['RECNUM'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      '\$type' : 'MBEHPublisher.Models.InstantSaleData, Models',
      'SaleGuid': instance.saleGuid,
      'CreatedOn': instance.createdOn.toIso8601String(),
      'PaidOn': instance.paidOn.toIso8601String(),
      'ServiceFee': instance.serviceFee,
      'ServiceFeePercentage': instance.serviceFeePercentage,
      'DiscountPercentage': instance.discountPercentage,
      'Discount': instance.discount,
      'PaymentList': instance.paymentList.map((e) => e.toJson()).toList(),
      'ProductList': instance.productList.map((e) => e.toJson()).toList(),
      'APNUM': instance.aPNUM,
      'CLNUM': instance.cLNUM,
      'RECNUM': instance.rECNUM,
    };
