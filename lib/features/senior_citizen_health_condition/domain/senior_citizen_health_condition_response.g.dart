// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_health_condition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenHealthConditionResponse
_$SeniorCitizenHealthConditionResponseFromJson(Map<String, dynamic> json) =>
    SeniorCitizenHealthConditionResponse(
      id: (json['id'] as num).toInt(),
      seniorCitizenProfile: SeniorCitizenProfileMinimunResponse.fromJson(
        json['seniorCitizenProfile'] as Map<String, dynamic>,
      ),
      healthCondition: HealthConditionMinimunResponse.fromJson(
        json['healthCondition'] as Map<String, dynamic>,
      ),
      diagnosisDate: DateTime.parse(json['diagnosisDate'] as String),
      severity: json['severity'] as String,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$SeniorCitizenHealthConditionResponseToJson(
  SeniorCitizenHealthConditionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'seniorCitizenProfile': instance.seniorCitizenProfile,
  'healthCondition': instance.healthCondition,
  'diagnosisDate': instance.diagnosisDate.toIso8601String(),
  'severity': instance.severity,
  'createAt': instance.createAt?.toIso8601String(),
};
