// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assing_token_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssingTokenDeviceRequest _$AssingTokenDeviceRequestFromJson(
  Map<String, dynamic> json,
) => AssingTokenDeviceRequest(
  userId: json['userId'] as String,
  deviceToken: json['deviceToken'] as String,
);

Map<String, dynamic> _$AssingTokenDeviceRequestToJson(
  AssingTokenDeviceRequest instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'deviceToken': instance.deviceToken,
};
