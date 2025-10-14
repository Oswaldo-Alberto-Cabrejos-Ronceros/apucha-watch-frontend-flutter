import 'package:json_annotation/json_annotation.dart';

part 'senior_citizen_health_minimum_response.g.dart';

@JsonSerializable()
class SeniorCitizenHealthMinimumResponse {
  final String id;

  SeniorCitizenHealthMinimumResponse({required this.id});

  factory SeniorCitizenHealthMinimumResponse.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenHealthMinimumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeniorCitizenHealthMinimumResponseToJson(this);
}
