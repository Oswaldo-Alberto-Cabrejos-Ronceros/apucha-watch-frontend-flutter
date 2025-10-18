import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_health_condition_request.g.dart';

@JsonSerializable()
class SeniorCitizenHealthConditionRequest {
  final int seniorCitizenProfileId;
  final int healthConditionId;
  final DateTime diagnosisDate;
  final String severity;

  SeniorCitizenHealthConditionRequest({
    required this.seniorCitizenProfileId,
    required this.healthConditionId,
    required this.diagnosisDate,
    required this.severity,
  });

  factory SeniorCitizenHealthConditionRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$SeniorCitizenHealthConditionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SeniorCitizenHealthConditionRequestToJson(this);
}
