// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EHPaymentItem _$EHPaymentItemFromJson(Map<String, dynamic> json) {
  return EHPaymentItem(
    json['Type'] as int,
    (json['Amount'] as num).toDouble(),
  );
}

Map<String, dynamic> _$EHPaymentItemToJson(EHPaymentItem instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Amount': instance.amount,
    };
