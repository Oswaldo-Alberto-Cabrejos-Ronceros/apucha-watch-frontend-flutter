// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_condition_recommendation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthConditionRecommendationRequest
_$HealthConditionRecommendationRequestFromJson(Map<String, dynamic> json) =>
    HealthConditionRecommendationRequest(
      healthConditionId: json['healthConditionId'] as String,
      healthRecommendationId: json['healthRecommendationId'] as String,
    );

Map<String, dynamic> _$HealthConditionRecommendationRequestToJson(
  HealthConditionRecommendationRequest instance,
) => <String, dynamic>{
  'healthConditionId': instance.healthConditionId,
  'healthRecommendationId': instance.healthRecommendationId,
};
