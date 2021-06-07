import 'package:json_annotation/json_annotation.dart';

part 'PaymentItem.g.dart';

@JsonSerializable()
class EHPaymentItem
{
  final int type;
  final double amount;

  EHPaymentItem(this.type, this.amount);

  factory EHPaymentItem.fromJson(Map<String, dynamic> json) =>
      _$EHPaymentItemFromJson(json);
  Map<String, dynamic> toJson() => _$EHPaymentItemToJson(this);
}