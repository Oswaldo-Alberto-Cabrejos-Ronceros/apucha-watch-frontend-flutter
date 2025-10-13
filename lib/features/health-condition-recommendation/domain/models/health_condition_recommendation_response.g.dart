// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_condition_recommendation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthConditionRecommendationResponse
_$HealthConditionRecommendationResponseFromJson(Map<String, dynamic> json) =>
    HealthConditionRecommendationResponse(
      id: json['id'] as String,
      healthCondition: HealthConditionMinimunResponse.fromJson(
        json['healthCondition'] as Map<String, dynamic>,
      ),
      healthRecommendation: HealthRecommendationMinimunResponse.fromJson(
        json['healthRecommendation'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$HealthConditionRecommendationResponseToJson(
  HealthConditionRecommendationResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'healthCondition': instance.healthCondition,
  'healthRecommendation': instance.healthRecommendation,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
};
