// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenProfileResponse _$SeniorCitizenProfileResponseFromJson(
  Map<String, dynamic> json,
) => SeniorCitizenProfileResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  lastname: json['lastname'] as String,
  birthdate: DateTime.parse(json['birthdate'] as String),
  device: DeviceMininumResponse.fromJson(
    json['device'] as Map<String, dynamic>,
  ),
  createAt: DateTime.parse(json['createAt'] as String),
  updateAt: json['updateAt'] == null
      ? null
      : DateTime.parse(json['updateAt'] as String),
  deleteAt: json['deleteAt'] == null
      ? null
      : DateTime.parse(json['deleteAt'] as String),
);

Map<String, dynamic> _$SeniorCitizenProfileResponseToJson(
  SeniorCitizenProfileResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'lastname': instance.lastname,
  'birthdate': instance.birthdate.toIso8601String(),
  'device': instance.device,
  'createAt': instance.createAt.toIso8601String(),
  'updateAt': instance.updateAt?.toIso8601String(),
  'deleteAt': instance.deleteAt?.toIso8601String(),
};
