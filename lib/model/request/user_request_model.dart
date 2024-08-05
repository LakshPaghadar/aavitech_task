import 'package:json_annotation/json_annotation.dart';

part 'user_request_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UserRequestModel {
  @JsonKey(name: 'UserName')
  final String? userName;

  @JsonKey(name: 'Password')
  final String? password;

  @JsonKey(name: 'DeviceId')
  final String? deviceId;

  @JsonKey(name: 'Active')
  final bool? active;

  @JsonKey(name: 'AppType')
  final String? appType;

  @JsonKey(name: 'FirstName')
  final String? firstName;

  @JsonKey(name: 'Id')
  final int? id;

  @JsonKey(name: 'LastName')
  final String? lastName;

  @JsonKey(name: 'OrderCode')
  final String? orderCode;

  @JsonKey(name: 'OrderCount')
  final int? orderCount;

  @JsonKey(name: 'OrderPredictionCount')
  final int? orderPredictionCount;

  @JsonKey(name: 'Role')
  final String? role;

  @JsonKey(name: 'IsResetSync', includeIfNull: false)
  final bool? isResetSync;

  UserRequestModel({
    this.userName,
    this.password,
    this.deviceId,
    this.active,
    this.appType,
    this.firstName,
    this.id,
    this.lastName,
    this.orderCode,
    this.orderCount,
    this.orderPredictionCount,
    this.role,
    this.isResetSync,
  });

  factory UserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestModelToJson(this);
}
