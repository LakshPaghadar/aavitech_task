import 'package:json_annotation/json_annotation.dart';
import 'customer_response_model.dart';

part 'customer_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerResponse {
  @JsonKey(name: "GetCustomersResult")
  List<Customer>? customers;

  CustomerResponse({this.customers});

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}
