import 'package:json_annotation/json_annotation.dart';

import 'PaymentItem.dart';
import 'SaleProduct.dart';

part 'PublishData.g.dart';

@JsonSerializable(explicitToJson: true)
class PublishData {
  final Data data;
  final int type;
  final String tenantName;
  final int clientID;
  final int storageID;
  final int userID;

  PublishData(this.data, this.type, this.tenantName, this.clientID, this.storageID, this.userID);

  factory PublishData.fromJson(Map<String, dynamic> json) => _$PublishDataFromJson(json);
  Map<String, dynamic> toJson() => _$PublishDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data{
  final String $type = 'MBEHPublisher.Models.InstantSaleData, Models';
  final String saleGuid;
  final DateTime createdOn;
  final DateTime paidOn;
  final double serviceFee;
  final double serviceFeePercentage;
  final double discountPercentage;
  final double discount;
  final List<EHPaymentItem> paymentList;
  final List<SaleProduct> productList;
  final String? aPNUM;
  final String? cLNUM;
  final String? rECNUM;

  Data(this.saleGuid, this.createdOn, this.paidOn, this.serviceFee, this.serviceFeePercentage, this.discountPercentage, this.discount, this.paymentList, this.productList, this.aPNUM, this.cLNUM, this.rECNUM);
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
