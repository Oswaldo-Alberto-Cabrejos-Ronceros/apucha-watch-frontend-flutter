import 'package:json_annotation/json_annotation.dart';
import 'package:apucha_watch_movil/features/health-condition-recommendation/domain/models/health_condition_recommendation_minimun_response.dart';

part 'health_condition_response.g.dart';

@JsonSerializable()
class HealthConditionResponse {
  final int id;
  final String name;
  final List<HealthConditionRecommendationMinimunResponse>? healthConditionRecommendations;

  HealthConditionResponse({
    required this.id,
    required this.name,
    this.healthConditionRecommendations,
  });

  factory HealthConditionResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthConditionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HealthConditionResponseToJson(this);
}