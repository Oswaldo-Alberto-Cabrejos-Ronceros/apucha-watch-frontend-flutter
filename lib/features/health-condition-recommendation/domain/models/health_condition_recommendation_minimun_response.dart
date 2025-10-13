import 'package:json_annotation/json_annotation.dart';

part 'health_condition_recommendation_minimun_response.g.dart';

@JsonSerializable()
class HealthConditionRecommendationMinimunResponse {
  final String id;

  HealthConditionRecommendationMinimunResponse({required this.id});

  factory HealthConditionRecommendationMinimunResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthConditionRecommendationMinimunResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HealthConditionRecommendationMinimunResponseToJson(this);
}