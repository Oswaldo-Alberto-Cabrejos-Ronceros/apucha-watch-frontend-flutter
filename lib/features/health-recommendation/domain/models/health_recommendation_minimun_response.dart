import 'package:json_annotation/json_annotation.dart';
part 'health_recommendation_minimun_response.g.dart';

@JsonSerializable()
class HealthRecommendationMinimunResponse {
  final String id;

  HealthRecommendationMinimunResponse({required this.id});

  factory HealthRecommendationMinimunResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthRecommendationMinimunResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HealthRecommendationMinimunResponseToJson(this);
}