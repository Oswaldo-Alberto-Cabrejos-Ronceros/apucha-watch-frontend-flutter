import 'package:json_annotation/json_annotation.dart';

part 'fall_alert_request.g.dart';

@JsonSerializable()
class FallAlertRequest {
  final String patientId;
  final DateTime timestamp;
  final bool fallDetected;

  FallAlertRequest({
    required this.patientId,
    required this.timestamp,
    required this.fallDetected,
  });

  factory FallAlertRequest.fromJson(Map<String, dynamic> json) =>
      _$FallAlertRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FallAlertRequestToJson(this);
}
