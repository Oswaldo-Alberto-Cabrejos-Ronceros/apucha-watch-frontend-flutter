// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_sign_minimun_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VitalSignMinimunResponse _$VitalSignMinimunResponseFromJson(
  Map<String, dynamic> json,
) => VitalSignMinimunResponse(
  heartRate: (json['heartRate'] as num).toInt(),
  oxygenSaturation: (json['oxygenSaturation'] as num).toInt(),
);

Map<String, dynamic> _$VitalSignMinimunResponseToJson(
  VitalSignMinimunResponse instance,
) => <String, dynamic>{
  'heartRate': instance.heartRate,
  'oxygenSaturation': instance.oxygenSaturation,
};
