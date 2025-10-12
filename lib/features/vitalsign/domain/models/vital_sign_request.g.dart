// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_sign_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalSignRequest _$VitalSignRequestFromJson(Map<String, dynamic> json) =>
    VitalSignRequest(
      deviceCode: json['deviceCode'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      heartRate: (json['heartRate'] as num).toInt(),
      oxygenSaturation: (json['oxygenSaturation'] as num).toInt(),
    );

Map<String, dynamic> _$VitalSignRequestToJson(VitalSignRequest instance) =>
    <String, dynamic>{
      'deviceCode': instance.deviceCode,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'heartRate': instance.heartRate,
      'oxygenSaturation': instance.oxygenSaturation,
    };
