// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      getProductsResult: (json['GetProductsResult'] as List<dynamic>)
          .map((e) => GetProductsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'GetProductsResult': instance.getProductsResult,
    };

GetProductsResult _$GetProductsResultFromJson(Map<String, dynamic> json) =>
    GetProductsResult(
      barCode: json['BarCode'] as String?,
      createdDate: json['CreatedDate'] as String?,
      deleted: json['Deleted'] as bool?,
      id: (json['Id'] as num?)?.toInt(),
      isSpecialOfferSelected: json['IsSpecialOfferSelected'] as bool?,
      isWeight: json['IsWeight'] as bool?,
      modifiedDate: json['ModifiedDate'] as String?,
      name: json['Name'] as String?,
      nominalCode: json['NominalCode'] as String?,
      packSize: (json['PackSize'] as num?)?.toInt(),
      price: (json['Price'] as num?)?.toDouble(),
      productCategory: json['ProductCategory'] as String?,
      productCode: json['ProductCode'] as String?,
      productVatId: (json['ProductVatId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProductsResultToJson(GetProductsResult instance) =>
    <String, dynamic>{
      'BarCode': instance.barCode,
      'CreatedDate': instance.createdDate,
      'Deleted': instance.deleted,
      'Id': instance.id,
      'IsSpecialOfferSelected': instance.isSpecialOfferSelected,
      'IsWeight': instance.isWeight,
      'ModifiedDate': instance.modifiedDate,
      'Name': instance.name,
      'NominalCode': instance.nominalCode,
      'PackSize': instance.packSize,
      'Price': instance.price,
      'ProductCategory': instance.productCategory,
      'ProductCode': instance.productCode,
      'ProductVatId': instance.productVatId,
    };
