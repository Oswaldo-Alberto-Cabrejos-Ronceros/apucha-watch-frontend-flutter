import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_health_condition_update_request.g.dart';

@JsonSerializable()
class SeniorCitizenHealthConditionUpdateRequest {
  final DateTime? diagnosisDate;
  final String? severity;

  SeniorCitizenHealthConditionUpdateRequest({
    this.diagnosisDate,
    this.severity,
  });

  factory SeniorCitizenHealthConditionUpdateRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$SeniorCitizenHealthConditionUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SeniorCitizenHealthConditionUpdateRequestToJson(this);
}
