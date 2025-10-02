// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenRequest _$SeniorCitizenRequestFromJson(
  Map<String, dynamic> json,
) => SeniorCitizenRequest(
  name: json['name'] as String,
  lastname: json['lastname'] as String,
  birthdate: DateTime.parse(json['birthdate'] as String),
  deviceId: (json['deviceId'] as num).toInt(),
);

Map<String, dynamic> _$SeniorCitizenRequestToJson(
  SeniorCitizenRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'lastname': instance.lastname,
  'birthdate': instance.birthdate.toIso8601String(),
  'deviceId': instance.deviceId,
};
