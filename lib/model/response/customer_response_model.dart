import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_response_model.g.dart';

@Entity()
@JsonSerializable(explicitToJson: true)
class Customer {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @JsonKey(name: "AccountRef")
  String? accountRef;

  @JsonKey(name: "Address1")
  String? address1;

  @JsonKey(name: "Address2")
  String? address2;

  @JsonKey(name: "Address3")
  String? address3;

  @JsonKey(name: "Address4")
  String? address4;

  @JsonKey(name: "Address5")
  String? address5;

  @JsonKey(name: "CAddress1")
  String? cAddress1;

  @JsonKey(name: "CAddress2")
  String? cAddress2;

  @JsonKey(name: "CAddress3")
  String? cAddress3;

  @JsonKey(name: "CAddress4")
  String? cAddress4;

  @JsonKey(name: "CAddress5")
  String? cAddress5;

  @JsonKey(name: "ContactName")
  String? contactName;

  @JsonKey(name: "CountryCode")
  String? countryCode;

  @JsonKey(name: "CreatedDate")
  String? createdDate;

  @JsonKey(name: "DateAccountOpened")
  String? dateAccountOpened;

  @JsonKey(name: "DiscountPercentage")
  double? discountPercentage;

  @JsonKey(name: "Email")
  String? email;

  @JsonKey(name: "Fax")
  String? fax;

  @JsonKey(name: "IsCostcutter")
  bool? isCostcutter;

  @JsonKey(name: "IsDeleted")
  bool? isDeleted;

  @JsonKey(name: "IsHenderson")
  bool? isHenderson;

  @JsonKey(name: "IsMessageEnabled")
  bool? isMessageEnabled;

  @JsonKey(name: "IsMusgrave")
  bool? isMusgrave;

  @JsonKey(name: "IsPredictionEnable")
  bool? isPredictionEnable;

  @JsonKey(name: "IsTemplateEnable")
  bool? isTemplateEnable;

  @JsonKey(name: "Message")
  String? message;

  @JsonKey(name: "ModifiedDate")
  String? modifiedDate;

  @JsonKey(name: "Name")
  String? name;

  @JsonKey(name: "Telephone")
  String? telephone;

  @JsonKey(name: "Telephone2")
  String? telephone2;

  @JsonKey(name: "WebAddress")
  String? webAddress;

  Customer({
    this.id,
    this.accountRef,
    this.address1,
    this.address2,
    this.address3,
    this.address4,
    this.address5,
    this.cAddress1,
    this.cAddress2,
    this.cAddress3,
    this.cAddress4,
    this.cAddress5,
    this.contactName,
    this.countryCode,
    this.createdDate,
    this.dateAccountOpened,
    this.discountPercentage,
    this.email,
    this.fax,
    this.isCostcutter,
    this.isDeleted,
    this.isHenderson,
    this.isMessageEnabled,
    this.isMusgrave,
    this.isPredictionEnable,
    this.isTemplateEnable,
    this.message,
    this.modifiedDate,
    this.name,
    this.telephone,
    this.telephone2,
    this.webAddress,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
