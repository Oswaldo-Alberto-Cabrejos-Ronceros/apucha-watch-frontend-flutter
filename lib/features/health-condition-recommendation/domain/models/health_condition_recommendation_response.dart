import 'package:json_annotation/json_annotation.dart';
import 'package:apucha_watch_movil/features/health-condition/domain/models/health_condition_minimun_response.dart';
import 'package:apucha_watch_movil/features/health-recommendation/domain/models/health_recommendation_minimun_response.dart';

part 'health_condition_recommendation_response.g.dart';

@JsonSerializable()
class HealthConditionRecommendationResponse {
  final String id;
  final HealthConditionMinimunResponse healthCondition;
  final HealthRecommendationMinimunResponse healthRecommendation;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  HealthConditionRecommendationResponse({
    required this.id,
    required this.healthCondition,
    required this.healthRecommendation,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory HealthConditionRecommendationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$HealthConditionRecommendationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HealthConditionRecommendationResponseToJson(this);
}