// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cared_senior_citizen_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaredSeniorCitizenRequest _$CaredSeniorCitizenRequestFromJson(
  Map<String, dynamic> json,
) => CaredSeniorCitizenRequest(
  caredProfileId: (json['caredProfileId'] as num).toInt(),
  seniorCitizenProfileId: (json['seniorCitizenProfileId'] as num).toInt(),
);

Map<String, dynamic> _$CaredSeniorCitizenRequestToJson(
  CaredSeniorCitizenRequest instance,
) => <String, dynamic>{
  'caredProfileId': instance.caredProfileId,
  'seniorCitizenProfileId': instance.seniorCitizenProfileId,
};
