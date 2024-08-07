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

  @override
  String toString() {
    return 'Customer(id: $id, accountRef: $accountRef, address1: $address1, address2: $address2, address3: $address3, address4: $address4, address5: $address5, cAddress1: $cAddress1, cAddress2: $cAddress2, cAddress3: $cAddress3, cAddress4: $cAddress4, cAddress5: $cAddress5, contactName: $contactName, countryCode: $countryCode, createdDate: $createdDate, dateAccountOpened: $dateAccountOpened, discountPercentage: $discountPercentage, email: $email, fax: $fax, isCostcutter: $isCostcutter, isDeleted: $isDeleted, isHenderson: $isHenderson, isMessageEnabled: $isMessageEnabled, isMusgrave: $isMusgrave, isPredictionEnable: $isPredictionEnable, isTemplateEnable: $isTemplateEnable, message: $message, modifiedDate: $modifiedDate, name: $name, telephone: $telephone, telephone2: $telephone2, webAddress: $webAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.id == id &&
        other.accountRef == accountRef &&
        other.address1 == address1 &&
        other.address2 == address2 &&
        other.address3 == address3 &&
        other.address4 == address4 &&
        other.address5 == address5 &&
        other.cAddress1 == cAddress1 &&
        other.cAddress2 == cAddress2 &&
        other.cAddress3 == cAddress3 &&
        other.cAddress4 == cAddress4 &&
        other.cAddress5 == cAddress5 &&
        other.contactName == contactName &&
        other.countryCode == countryCode &&
        other.createdDate == createdDate &&
        other.dateAccountOpened == dateAccountOpened &&
        other.discountPercentage == discountPercentage &&
        other.email == email &&
        other.fax == fax &&
        other.isCostcutter == isCostcutter &&
        other.isDeleted == isDeleted &&
        other.isHenderson == isHenderson &&
        other.isMessageEnabled == isMessageEnabled &&
        other.isMusgrave == isMusgrave &&
        other.isPredictionEnable == isPredictionEnable &&
        other.isTemplateEnable == isTemplateEnable &&
        other.message == message &&
        other.modifiedDate == modifiedDate &&
        other.name == name &&
        other.telephone == telephone &&
        other.telephone2 == telephone2 &&
        other.webAddress == webAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    accountRef.hashCode ^
    address1.hashCode ^
    address2.hashCode ^
    address3.hashCode ^
    address4.hashCode ^
    address5.hashCode ^
    cAddress1.hashCode ^
    cAddress2.hashCode ^
    cAddress3.hashCode ^
    cAddress4.hashCode ^
    cAddress5.hashCode ^
    contactName.hashCode ^
    countryCode.hashCode ^
    createdDate.hashCode ^
    dateAccountOpened.hashCode ^
    discountPercentage.hashCode ^
    email.hashCode ^
    fax.hashCode ^
    isCostcutter.hashCode ^
    isDeleted.hashCode ^
    isHenderson.hashCode ^
    isMessageEnabled.hashCode ^
    isMusgrave.hashCode ^
    isPredictionEnable.hashCode ^
    isTemplateEnable.hashCode ^
    message.hashCode ^
    modifiedDate.hashCode ^
    name.hashCode ^
    telephone.hashCode ^
    telephone2.hashCode ^
    webAddress.hashCode;
  }
}
