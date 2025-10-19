import 'package:apucha_watch_movil/features/health-condition/domain/models/health_condition_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_health_condition_with_health_condition_response.g.dart';

@JsonSerializable()
class SeniorCitizenHealthConditionWithHealthConditionResponse {
  final int id;
  final HealthConditionResponse healthCondition;
  final DateTime diagnosisDate;
  final String severity;
  final DateTime? createAt;

  SeniorCitizenHealthConditionWithHealthConditionResponse({required this.id, required this.healthCondition, required this.diagnosisDate, required this.severity, this.createAt});

    factory SeniorCitizenHealthConditionWithHealthConditionResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$SeniorCitizenHealthConditionWithHealthConditionResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SeniorCitizenHealthConditionWithHealthConditionResponseToJson(this);
}
