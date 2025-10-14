// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fall_alert_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FallAlertResponse _$FallAlertResponseFromJson(Map<String, dynamic> json) =>
    FallAlertResponse(
      id: json['id'] as int,
      patientId: json['patientId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      fallDetected: json['fallDetected'] as bool,
      severity: json['severity'] as String,
    );

Map<String, dynamic> _$FallAlertResponseToJson(FallAlertResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'timestamp': instance.timestamp.toIso8601String(),
      'fallDetected': instance.fallDetected,
      'severity': instance.severity,
    };
