// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fall_alert_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FallAlertRequest _$FallAlertRequestFromJson(Map<String, dynamic> json) =>
    FallAlertRequest(
      userId: json['userId'] as String,
      deviceCode: json['deviceCode'] as String?,
      timestamp: FallAlertRequest._fromJson(json['timestamp']),
      fallDetected: json['fallDetected'] as bool,
    );

Map<String, dynamic> _$FallAlertRequestToJson(FallAlertRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceCode': instance.deviceCode,
      'timestamp': FallAlertRequest._toJson(instance.timestamp),
      'fallDetected': instance.fallDetected,
    };
