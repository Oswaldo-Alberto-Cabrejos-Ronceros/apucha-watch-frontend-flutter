// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vital_signs_alert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVitalSignsAlertDto _$CreateVitalSignsAlertDtoFromJson(
  Map<String, dynamic> json,
) => CreateVitalSignsAlertDto(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  severity: json['severity'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$CreateVitalSignsAlertDtoToJson(
  CreateVitalSignsAlertDto instance,
) => <String, dynamic>{
  'seniorCitizenProfileId': instance.id,
  'type': instance.type,
  'severity': instance.severity,
  'timestamp': instance.timestamp.toIso8601String(),
};
