import 'package:json_annotation/json_annotation.dart';

part 'health_condition_recommendation_request.g.dart';

@JsonSerializable()
class HealthConditionRecommendationRequest {
  final String healthConditionId;
  final String healthRecommendationId;

  HealthConditionRecommendationRequest({
    required this.healthConditionId,
    required this.healthRecommendationId,
  });

  factory HealthConditionRecommendationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$HealthConditionRecommendationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HealthConditionRecommendationRequestToJson(this);
}