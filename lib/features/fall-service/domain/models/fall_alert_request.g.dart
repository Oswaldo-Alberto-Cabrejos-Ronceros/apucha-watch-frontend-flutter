// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fall_alert_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FallAlertRequest _$FallAlertRequestFromJson(Map<String, dynamic> json) =>
    FallAlertRequest(
      patientId: json['patientId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      fallDetected: json['fallDetected'] as bool,
    );

Map<String, dynamic> _$FallAlertRequestToJson(FallAlertRequest instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'timestamp': instance.timestamp.toIso8601String(),
      'fallDetected': instance.fallDetected,
    };
