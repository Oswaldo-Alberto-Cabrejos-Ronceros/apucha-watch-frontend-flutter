// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_recommendation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthRecommendationResponse _$HealthRecommendationResponseFromJson(
  Map<String, dynamic> json,
) => HealthRecommendationResponse(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$HealthRecommendationResponseToJson(
  HealthRecommendationResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
};
