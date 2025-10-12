// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_sign_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalSignResponse _$VitalSignResponseFromJson(Map<String, dynamic> json) =>
    VitalSignResponse(
      id: (json['id'] as num).toInt(),
      deviceCode: json['deviceCode'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      heartRate: (json['heartRate'] as num).toInt(),
      oxygenSaturation: (json['oxygenSaturation'] as num).toInt(),
      device: json['device'] == null
          ? null
          : DeviceMinimumResponse.fromJson(
              json['device'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VitalSignResponseToJson(VitalSignResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceCode': instance.deviceCode,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'heartRate': instance.heartRate,
      'oxygenSaturation': instance.oxygenSaturation,
      'device': instance.device?.toJson(),
    };
