// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      appVersionNo: json['appVersionNo'] as String?,
      deviceDate: json['deviceDate'] as String?,
      pageIndex: (json['pageIndex'] as num?)?.toInt(),
      syncDate: json['syncDate'] as String?,
      user: json['user'] == null
          ? null
          : UserRequestModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'syncDate': instance.syncDate,
      'pageIndex': instance.pageIndex,
      'appVersionNo': instance.appVersionNo,
      'deviceDate': instance.deviceDate,
      'user': instance.user,
    };
