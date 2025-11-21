// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_signs_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalSignsStats _$VitalSignsStatsFromJson(Map<String, dynamic> json) =>
    VitalSignsStats(
      heartRate: (json['heartRate'] as List<dynamic>)
          .map((e) => VitalSignPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      oxygenation: (json['oxygenation'] as List<dynamic>)
          .map((e) => VitalSignPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VitalSignsStatsToJson(VitalSignsStats instance) =>
    <String, dynamic>{
      'heartRate': instance.heartRate,
      'oxygenation': instance.oxygenation,
    };

VitalSignPoint _$VitalSignPointFromJson(Map<String, dynamic> json) =>
    VitalSignPoint(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$VitalSignPointToJson(VitalSignPoint instance) =>
    <String, dynamic>{'x': instance.x, 'y': instance.y};
