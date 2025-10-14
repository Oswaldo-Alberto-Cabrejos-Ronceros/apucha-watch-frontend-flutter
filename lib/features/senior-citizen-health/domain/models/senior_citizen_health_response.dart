import 'package:json_annotation/json_annotation.dart';

part 'senior_citizen_health_response.g.dart';

@JsonSerializable()
class SeniorCitizenHealthResponse {
  final String id;
  final String name;
  final int age;
  final int heartRate;
  final int systolic;
  final int diastolic;
  final int? glucoseLevel;
  final bool fallDetected;
  final bool medicationTaken;

  SeniorCitizenHealthResponse({
    required this.id,
    required this.name,
    required this.age,
    required this.heartRate,
    required this.systolic,
    required this.diastolic,
    this.glucoseLevel,
    required this.fallDetected,
    required this.medicationTaken,
  });

  factory SeniorCitizenHealthResponse.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenHealthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeniorCitizenHealthResponseToJson(this);
}
