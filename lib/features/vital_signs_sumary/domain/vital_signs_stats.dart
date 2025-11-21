import 'package:json_annotation/json_annotation.dart';

part 'vital_signs_stats.g.dart';

@JsonSerializable()
class VitalSignsStats {
  final List<VitalSignPoint> heartRate;
  final List<VitalSignPoint> oxygenation;

  VitalSignsStats({
    required this.heartRate,
    required this.oxygenation,
  });

  factory VitalSignsStats.fromJson(Map<String, dynamic> json) =>
      _$VitalSignsStatsFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSignsStatsToJson(this);
}

@JsonSerializable()
class VitalSignPoint {
  final double x;
  final double y;

  VitalSignPoint({required this.x, required this.y});

  factory VitalSignPoint.fromJson(Map<String, dynamic> json) =>
      _$VitalSignPointFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSignPointToJson(this);
}