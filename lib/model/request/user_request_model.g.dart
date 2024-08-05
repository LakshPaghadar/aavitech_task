// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) =>
    UserRequestModel(
      userName: json['UserName'] as String?,
      password: json['Password'] as String?,
      deviceId: json['DeviceId'] as String?,
      active: json['Active'] as bool?,
      appType: json['AppType'] as String?,
      firstName: json['FirstName'] as String?,
      id: (json['Id'] as num?)?.toInt(),
      lastName: json['LastName'] as String?,
      orderCode: json['OrderCode'] as String?,
      orderCount: (json['OrderCount'] as num?)?.toInt(),
      orderPredictionCount: (json['OrderPredictionCount'] as num?)?.toInt(),
      role: json['Role'] as String?,
      isResetSync: json['IsResetSync'] as bool?,
    );

Map<String, dynamic> _$UserRequestModelToJson(UserRequestModel instance) {
  final val = <String, dynamic>{
    'UserName': instance.userName,
    'Password': instance.password,
    'DeviceId': instance.deviceId,
    'Active': instance.active,
    'AppType': instance.appType,
    'FirstName': instance.firstName,
    'Id': instance.id,
    'LastName': instance.lastName,
    'OrderCode': instance.orderCode,
    'OrderCount': instance.orderCount,
    'OrderPredictionCount': instance.orderPredictionCount,
    'Role': instance.role,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IsResetSync', instance.isResetSync);
  return val;
}
