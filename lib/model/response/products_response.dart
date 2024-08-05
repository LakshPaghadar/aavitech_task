import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';


@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "GetProductsResult")
  final List<GetProductsResult> getProductsResult;

  ProductsResponse({
    required this.getProductsResult,
  });

  ProductsResponse copyWith({
    List<GetProductsResult>? getProductsResult,
  }) =>
      ProductsResponse(
        getProductsResult: getProductsResult ?? this.getProductsResult,
      );

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@entity
@JsonSerializable()
class GetProductsResult {


  @JsonKey(name: "BarCode")
  final String? barCode;
  @JsonKey(name: "CreatedDate")
  final String? createdDate;
  @JsonKey(name: "Deleted")
  final bool? deleted;

  @PrimaryKey(autoGenerate: true)
  @JsonKey(name: "Id")
  final int? id;

  @JsonKey(name: "IsSpecialOfferSelected")
  final bool? isSpecialOfferSelected;
  @JsonKey(name: "IsWeight")
  final bool? isWeight;
  @JsonKey(name: "ModifiedDate")
  final String? modifiedDate;
  @JsonKey(name: "Name")
  final String? name;
  @JsonKey(name: "NominalCode")
  final String? nominalCode;
  @JsonKey(name: "PackSize")
  final int? packSize;
  @JsonKey(name: "Price")
  final double? price;
  @JsonKey(name: "ProductCategory")
  final String? productCategory;
  @JsonKey(name: "ProductCode")
  final String? productCode;
  @JsonKey(name: "ProductVatId")
  final int? productVatId;

  GetProductsResult({
    this.barCode,
    this.createdDate,
    this.deleted,
    this.id,
    this.isSpecialOfferSelected,
    this.isWeight,
    this.modifiedDate,
    this.name,
    this.nominalCode,
    this.packSize,
    this.price,
    this.productCategory,
    this.productCode,
    this.productVatId,
  });

  GetProductsResult copyWith({
    String? barCode,
    String? createdDate,
    bool? deleted,
    int? id,
    bool? isSpecialOfferSelected,
    bool? isWeight,
    String? modifiedDate,
    String? name,
    String? nominalCode,
    int? packSize,
    double? price,
    String? productCategory,
    String? productCode,
    int? productVatId,
  }) =>
      GetProductsResult(
        barCode: barCode ?? this.barCode,
        createdDate: createdDate ?? this.createdDate,
        deleted: deleted ?? this.deleted,
        id: id ?? this.id,
        isSpecialOfferSelected: isSpecialOfferSelected ?? this.isSpecialOfferSelected,
        isWeight: isWeight ?? this.isWeight,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        name: name ?? this.name,
        nominalCode: nominalCode ?? this.nominalCode,
        packSize: packSize ?? this.packSize,
        price: price ?? this.price,
        productCategory: productCategory ?? this.productCategory,
        productCode: productCode ?? this.productCode,
        productVatId: productVatId ?? this.productVatId,
      );

  factory GetProductsResult.fromJson(Map<String, dynamic> json) => _$GetProductsResultFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsResultToJson(this);
}
