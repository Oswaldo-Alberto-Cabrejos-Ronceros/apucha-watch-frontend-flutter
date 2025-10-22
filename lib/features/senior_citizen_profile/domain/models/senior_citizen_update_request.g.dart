// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenUpdateRequest _$SeniorCitizenUpdateRequestFromJson(
  Map<String, dynamic> json,
) => SeniorCitizenUpdateRequest(
  name: json['name'] as String?,
  lastname: json['lastname'] as String?,
  birthdate: json['birthdate'] as String?,
);

Map<String, dynamic> _$SeniorCitizenUpdateRequestToJson(
  SeniorCitizenUpdateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'lastname': instance.lastname,
  'birthdate': instance.birthdate,
};
