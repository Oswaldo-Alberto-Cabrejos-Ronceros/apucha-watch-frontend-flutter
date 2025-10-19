import 'package:apucha_watch_movil/features/senior_citizen_health_condition/domain/health_condition_minimun_response.dart';
import 'package:apucha_watch_movil/features/senior_citizen_health_condition/domain/senior_citizen_profile_minimun_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_health_condition_response.g.dart';

@JsonSerializable()
class SeniorCitizenHealthConditionResponse {
  final int id;
  final SeniorCitizenProfileMinimunResponse seniorCitizenProfile;
  final HealthConditionMinimunResponse healthCondition;
  final DateTime diagnosisDate;
  final String severity;
  final DateTime? createAt;

  SeniorCitizenHealthConditionResponse({
    required this.id,
    required this.seniorCitizenProfile,
    required this.healthCondition,
    required this.diagnosisDate,
    required this.severity,
    this.createAt,
  });

  factory SeniorCitizenHealthConditionResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$SeniorCitizenHealthConditionResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SeniorCitizenHealthConditionResponseToJson(this);
}
