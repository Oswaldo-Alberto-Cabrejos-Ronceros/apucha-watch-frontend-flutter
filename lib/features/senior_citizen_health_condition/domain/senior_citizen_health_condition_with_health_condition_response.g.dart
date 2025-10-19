// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_health_condition_with_health_condition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenHealthConditionWithHealthConditionResponse
_$SeniorCitizenHealthConditionWithHealthConditionResponseFromJson(
  Map<String, dynamic> json,
) => SeniorCitizenHealthConditionWithHealthConditionResponse(
  id: (json['id'] as num).toInt(),
  healthCondition: HealthConditionResponse.fromJson(
    json['healthCondition'] as Map<String, dynamic>,
  ),
  diagnosisDate: DateTime.parse(json['diagnosisDate'] as String),
  severity: json['severity'] as String,
  createAt: json['createAt'] == null
      ? null
      : DateTime.parse(json['createAt'] as String),
);

Map<String, dynamic>
_$SeniorCitizenHealthConditionWithHealthConditionResponseToJson(
  SeniorCitizenHealthConditionWithHealthConditionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'healthCondition': instance.healthCondition,
  'diagnosisDate': instance.diagnosisDate.toIso8601String(),
  'severity': instance.severity,
  'createAt': instance.createAt?.toIso8601String(),
};
