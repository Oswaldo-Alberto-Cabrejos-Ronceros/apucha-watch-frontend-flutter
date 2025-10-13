// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_recommendation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthRecommendationRequest _$HealthRecommendationRequestFromJson(
  Map<String, dynamic> json,
) => HealthRecommendationRequest(
  name: json['name'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$HealthRecommendationRequestToJson(
  HealthRecommendationRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
};
