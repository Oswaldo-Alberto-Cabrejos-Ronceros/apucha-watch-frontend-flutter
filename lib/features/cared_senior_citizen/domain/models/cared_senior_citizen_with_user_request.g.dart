// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cared_senior_citizen_with_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaredSeniorCitizenWithUserRequest _$CaredSeniorCitizenWithUserRequestFromJson(
  Map<String, dynamic> json,
) => CaredSeniorCitizenWithUserRequest(
  userId: json['userId'] as String,
  seniorCitizenProfileId: (json['seniorCitizenProfileId'] as num).toInt(),
);

Map<String, dynamic> _$CaredSeniorCitizenWithUserRequestToJson(
  CaredSeniorCitizenWithUserRequest instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'seniorCitizenProfileId': instance.seniorCitizenProfileId,
};
