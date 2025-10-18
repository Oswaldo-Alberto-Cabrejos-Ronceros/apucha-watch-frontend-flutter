// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_health_condition_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenHealthConditionUpdateRequest
_$SeniorCitizenHealthConditionUpdateRequestFromJson(
  Map<String, dynamic> json,
) => SeniorCitizenHealthConditionUpdateRequest(
  diagnosisDate: json['diagnosisDate'] == null
      ? null
      : DateTime.parse(json['diagnosisDate'] as String),
  severity: json['severity'] as String?,
);

Map<String, dynamic> _$SeniorCitizenHealthConditionUpdateRequestToJson(
  SeniorCitizenHealthConditionUpdateRequest instance,
) => <String, dynamic>{
  'diagnosisDate': instance.diagnosisDate?.toIso8601String(),
  'severity': instance.severity,
};
