import 'package:json_annotation/json_annotation.dart';

part 'senior_citizen_health_response.g.dart';

@JsonSerializable()
class SeniorCitizenHealthResponse {
  final int id;
  final String name;
  final int age;
  final int heartRate;
  final int systolic;
  final int diastolic;
  final int? glucoseLevel;
  final bool fallDetected;
  final bool medicationTaken;
  final DateTime? timeStamp;
  final int? deviceId;
  final int? currentProfileId;

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
    this.timeStamp,
    this.deviceId,
    this.currentProfileId,
  });

  static DateTime? _fromJson(dynamic v) {
    if (v == null) return null;
    if (v is int) return DateTime.fromMillisecondsSinceEpoch(v).toUtc();
    return DateTime.parse(v as String).toUtc();
  }

  static dynamic _toJson(DateTime? d) => d?.toUtc().toIso8601String();

  factory SeniorCitizenHealthResponse.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenHealthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeniorCitizenHealthResponseToJson(this);
}
