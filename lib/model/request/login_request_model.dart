

import 'package:dummy_api_call_retrofit/model/request/user_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class LoginRequestModel {

  @JsonKey(name: 'syncDate')
  final String? syncDate;

  @JsonKey(name: 'pageIndex')
  final int? pageIndex;

  @JsonKey(name: 'appVersionNo')
  final String? appVersionNo;

  @JsonKey(name: 'deviceDate')
  final String? deviceDate;

  @JsonKey(name: 'user')
  final UserRequestModel? user;

  LoginRequestModel({this.appVersionNo,this.deviceDate,this.pageIndex,this.syncDate,this.user});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
