import 'package:json_annotation/json_annotation.dart';

part 'fall_alert_response.g.dart';

@JsonSerializable()
class FallAlertResponse {
  final int id;
  final String patientId;
  final DateTime timestamp;
  final bool fallDetected;
  final String severity;

  FallAlertResponse({
    required this.id,
    required this.patientId,
    required this.timestamp,
    required this.fallDetected,
    required this.severity,
  });

  factory FallAlertResponse.fromJson(Map<String, dynamic> json) =>
      _$FallAlertResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FallAlertResponseToJson(this);
}
