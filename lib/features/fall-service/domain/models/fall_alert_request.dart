import 'package:json_annotation/json_annotation.dart';

part 'fall_alert_request.g.dart';

class DateTimeIsoConverter implements JsonConverter<DateTime, dynamic> {
  const DateTimeIsoConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json == null) throw ArgumentError('timestamp is required');
    if (json is int) return DateTime.fromMillisecondsSinceEpoch(json).toUtc();
    return DateTime.parse(json as String).toUtc();
  }

  @override
  dynamic toJson(DateTime object) => object.toUtc().toIso8601String();
}

@JsonSerializable()
class FallAlertRequest {
  @JsonKey(name: 'userId')
  final String userId;

  @JsonKey(name: 'deviceCode')
  final String? deviceCode;

  @JsonKey(name: 'timestamp', fromJson: _fromJson, toJson: _toJson)
  final DateTime timestamp;

  @JsonKey(name: 'fallDetected')
  final bool fallDetected;

  FallAlertRequest({
    required this.userId,
    this.deviceCode,
    required this.timestamp,
    required this.fallDetected,
  });

  static DateTime _fromJson(dynamic value) => const DateTimeIsoConverter().fromJson(value);
  static dynamic _toJson(DateTime d) => const DateTimeIsoConverter().toJson(d);

  factory FallAlertRequest.fromJson(Map<String, dynamic> json) =>
      _$FallAlertRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FallAlertRequestToJson(this);
}


