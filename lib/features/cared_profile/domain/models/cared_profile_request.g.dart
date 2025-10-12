// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cared_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaredProfileRequest _$CaredProfileRequestFromJson(Map<String, dynamic> json) =>
    CaredProfileRequest(
      userId: json['userId'] as String,
      name: json['name'] as String,
      lastname: json['lastname'] as String,
    );

Map<String, dynamic> _$CaredProfileRequestToJson(
  CaredProfileRequest instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'name': instance.name,
  'lastname': instance.lastname,
};
