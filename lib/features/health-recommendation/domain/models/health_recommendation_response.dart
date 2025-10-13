import 'package:json_annotation/json_annotation.dart';

part 'health_recommendation_response.g.dart';

@JsonSerializable()
class HealthRecommendationResponse {
  final int id;
  final String title;
  final String description;

  HealthRecommendationResponse({
    required this.id,
    required this.title,
    required this.description,
  });

  factory HealthRecommendationResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthRecommendationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HealthRecommendationResponseToJson(this);
}