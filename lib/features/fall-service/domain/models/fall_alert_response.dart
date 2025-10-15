import 'package:json_annotation/json_annotation.dart';

part 'fall_alert_response.g.dart';

/// --- Helpers: converters and nested sensor/location schemas ---
class DateTimeConverter implements JsonConverter<DateTime, dynamic> {
  const DateTimeConverter();

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
class AccelerationSchema {
  final double x;
  final double y;
  final double z;

  AccelerationSchema({
    required this.x,
    required this.y,
    required this.z,
  });

  factory AccelerationSchema.fromJson(Map<String, dynamic> json) =>
      _$AccelerationSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$AccelerationSchemaToJson(this);
}

@JsonSerializable()
class GyroscopeSchema {
  final double x;
  final double y;
  final double z;

  GyroscopeSchema({
    required this.x,
    required this.y,
    required this.z,
  });

  factory GyroscopeSchema.fromJson(Map<String, dynamic> json) =>
      _$GyroscopeSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$GyroscopeSchemaToJson(this);
}

@JsonSerializable()
class Ubication {
  final String id;
  final String deviceCode;

  @JsonKey(name: 'timeStamp', fromJson: _fromJsonTS, toJson: _toJsonTS)
  final DateTime timeStamp;

  final double latitude;
  final double longitude;
  final double? altitude;
  final double? speed;
  final int? satellites;
  final double? hdop;

  Ubication({
    required this.id,
    required this.deviceCode,
    required this.timeStamp,
    required this.latitude,
    required this.longitude,
    this.altitude,
    this.speed,
    this.satellites,
    this.hdop,
  });

  static DateTime _fromJsonTS(dynamic v) => const DateTimeConverter().fromJson(v);
  static dynamic _toJsonTS(DateTime d) => const DateTimeConverter().toJson(d);

  factory Ubication.fromJson(Map<String, dynamic> json) => _$UbicationFromJson(json);
  Map<String, dynamic> toJson() => _$UbicationToJson(this);
}

@JsonSerializable()
class Fall {
  final String id;
  final String deviceCode;

  @JsonKey(name: 'timeStamp', fromJson: _fromJsonTS, toJson: _toJsonTS)
  final DateTime timeStamp;

  final AccelerationSchema acceleration;
  final GyroscopeSchema gyroscope;

  Fall({
    required this.id,
    required this.deviceCode,
    required this.timeStamp,
    required this.acceleration,
    required this.gyroscope,
  });

  static DateTime _fromJsonTS(dynamic v) => const DateTimeConverter().fromJson(v);
  static dynamic _toJsonTS(DateTime d) => const DateTimeConverter().toJson(d);

  factory Fall.fromJson(Map<String, dynamic> json) => _$FallFromJson(json);
  Map<String, dynamic> toJson() => _$FallToJson(this);
}

enum Severity { low, medium, high }

class SeverityConverter implements JsonConverter<Severity, String> {
  const SeverityConverter();

  @override
  Severity fromJson(String json) {
    switch (json.toLowerCase()) {
      case 'low':
        return Severity.low;
      case 'medium':
        return Severity.medium;
      case 'high':
        return Severity.high;
      default:
        return Severity.low;
    }
  }

  @override
  String toJson(Severity object) => object.toString().split('.').last;
}

@JsonSerializable()
class FallAlertResponse {
  final String id;

  @JsonKey(name: 'userId')
  final String userId;

  @JsonKey(name: 'deviceCode')
  final String? deviceCode;

  @JsonKey(name: 'timestamp', fromJson: _fromJsonTS2, toJson: _toJsonTS2)
  final DateTime timestamp;

  @JsonKey(name: 'fallDetected')
  final bool fallDetected;

  @JsonKey(name: 'severity')
  @SeverityConverter()
  final Severity severity;

  final Fall? fall;
  final Ubication? ubication;

  FallAlertResponse({
    required this.id,
    required this.userId,
    this.deviceCode,
    required this.timestamp,
    required this.fallDetected,
    required this.severity,
    this.fall,
    this.ubication,
  });

  static DateTime _fromJsonTS2(dynamic v) => const DateTimeConverter().fromJson(v);
  static dynamic _toJsonTS2(DateTime d) => const DateTimeConverter().toJson(d);

  factory FallAlertResponse.fromJson(Map<String, dynamic> json) =>
      _$FallAlertResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FallAlertResponseToJson(this);
}
