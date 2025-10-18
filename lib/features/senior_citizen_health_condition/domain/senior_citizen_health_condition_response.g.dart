// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_health_condition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenHealthConditionResponse
_$SeniorCitizenHealthConditionResponseFromJson(Map<String, dynamic> json) =>
    SeniorCitizenHealthConditionResponse(
      id: (json['id'] as num).toInt(),
      seniorCitizenProfileMinimunResponse:
          SeniorCitizenProfileMinimunResponse.fromJson(
            json['seniorCitizenProfileMinimunResponse'] as Map<String, dynamic>,
          ),
      healthConditionMinimunResponse: HealthConditionMinimunResponse.fromJson(
        json['healthConditionMinimunResponse'] as Map<String, dynamic>,
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
  'seniorCitizenProfileMinimunResponse':
      instance.seniorCitizenProfileMinimunResponse,
  'healthConditionMinimunResponse': instance.healthConditionMinimunResponse,
  'diagnosisDate': instance.diagnosisDate.toIso8601String(),
  'severity': instance.severity,
  'createAt': instance.createAt?.toIso8601String(),
};
