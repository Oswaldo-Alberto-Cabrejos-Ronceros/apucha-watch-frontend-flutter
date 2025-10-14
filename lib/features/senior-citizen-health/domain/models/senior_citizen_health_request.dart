import 'package:json_annotation/json_annotation.dart';

part 'senior_citizen_health_request.g.dart';

@JsonSerializable()
class SeniorCitizenHealthRequest {
  final String name;
  final int age;
  final int heartRate;
  final int systolic;
  final int diastolic;
  final int? glucoseLevel;
  final bool fallDetected;
  final bool medicationTaken;

  SeniorCitizenHealthRequest({
    required this.name,
    required this.age,
    required this.heartRate,
    required this.systolic,
    required this.diastolic,
    this.glucoseLevel,
    required this.fallDetected,
    required this.medicationTaken,
  });

  factory SeniorCitizenHealthRequest.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenHealthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SeniorCitizenHealthRequestToJson(this);
}
