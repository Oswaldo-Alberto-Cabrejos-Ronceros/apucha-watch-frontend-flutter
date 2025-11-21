import 'package:json_annotation/json_annotation.dart';

part 'vital_signs_stats.g.dart';

@JsonSerializable(explicitToJson: true)
class VitalSignsStats {
  final List<HeartRatePoint> heartRate;
  final List<OxygenationPoint> oxygenation;

  VitalSignsStats({
    required this.heartRate,
    required this.oxygenation,
  });

  factory VitalSignsStats.fromJson(Map<String, dynamic> json) =>
      _$VitalSignsStatsFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSignsStatsToJson(this);
}

@JsonSerializable()
class HeartRatePoint {
  final double x;
  final double y;

  HeartRatePoint({
    required this.x,
    required this.y,
  });

  factory HeartRatePoint.fromJson(Map<String, dynamic> json) =>
      _$HeartRatePointFromJson(json);

  Map<String, dynamic> toJson() => _$HeartRatePointToJson(this);
}

@JsonSerializable()
class OxygenationPoint {
  final double x;
  final double y;

  OxygenationPoint({
    required this.x,
    required this.y,
  });

  factory OxygenationPoint.fromJson(Map<String, dynamic> json) =>
      _$OxygenationPointFromJson(json);

  Map<String, dynamic> toJson() => _$OxygenationPointToJson(this);
}