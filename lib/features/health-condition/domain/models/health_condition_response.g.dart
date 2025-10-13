// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_condition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthConditionResponse _$HealthConditionResponseFromJson(
  Map<String, dynamic> json,
) => HealthConditionResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  healthConditionRecommendations:
      (json['healthConditionRecommendations'] as List<dynamic>?)
          ?.map(
            (e) => HealthConditionRecommendationMinimunResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$HealthConditionResponseToJson(
  HealthConditionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'healthConditionRecommendations': instance.healthConditionRecommendations,
};
