// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_health_condition_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenHealthConditionRequest
_$SeniorCitizenHealthConditionRequestFromJson(Map<String, dynamic> json) =>
    SeniorCitizenHealthConditionRequest(
      seniorCitizenProfileId: (json['seniorCitizenProfileId'] as num).toInt(),
      healthConditionId: (json['healthConditionId'] as num).toInt(),
      diagnosisDate: DateTime.parse(json['diagnosisDate'] as String),
      severity: json['severity'] as String,
    );

Map<String, dynamic> _$SeniorCitizenHealthConditionRequestToJson(
  SeniorCitizenHealthConditionRequest instance,
) => <String, dynamic>{
  'seniorCitizenProfileId': instance.seniorCitizenProfileId,
  'healthConditionId': instance.healthConditionId,
  'diagnosisDate': instance.diagnosisDate.toIso8601String(),
  'severity': instance.severity,
};
