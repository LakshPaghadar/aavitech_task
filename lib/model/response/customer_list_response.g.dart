// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      customers: (json['GetCustomersResult'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'GetCustomersResult': instance.customers?.map((e) => e.toJson()).toList(),
    };
