// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cared_senior_citizen_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaredSeniorCitizenResponse _$CaredSeniorCitizenResponseFromJson(
  Map<String, dynamic> json,
) => CaredSeniorCitizenResponse(
  id: (json['id'] as num).toInt(),
  caredProfile: CaredProfileMinimunResponse.fromJson(
    json['caredProfile'] as Map<String, dynamic>,
  ),
  seniorCitizenProfile: SeniorCitizenProfileMinimunResponse.fromJson(
    json['seniorCitizenProfile'] as Map<String, dynamic>,
  ),
  createAt: DateTime.parse(json['createAt'] as String),
);

Map<String, dynamic> _$CaredSeniorCitizenResponseToJson(
  CaredSeniorCitizenResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'caredProfile': instance.caredProfile,
  'seniorCitizenProfile': instance.seniorCitizenProfile,
  'createAt': instance.createAt.toIso8601String(),
};
