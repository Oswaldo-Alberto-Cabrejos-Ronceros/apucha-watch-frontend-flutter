import 'package:json_annotation/json_annotation.dart';

part 'health_recommendation_request.g.dart';

@JsonSerializable()
class HealthRecommendationRequest {
  final String name;
  final String description;

  HealthRecommendationRequest({
    required this.name,
    required this.description,
  });

  factory HealthRecommendationRequest.fromJson(Map<String, dynamic> json) =>
      _$HealthRecommendationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HealthRecommendationRequestToJson(this);
}