// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cared_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaredProfileResponse _$CaredProfileResponseFromJson(
  Map<String, dynamic> json,
) => CaredProfileResponse(
  id: (json['id'] as num).toInt(),
  userId: json['userId'] as String,
  name: json['name'] as String,
  lastname: json['lastname'] as String,
  userType: json['userType'] as String,
  createAt: DateTime.parse(json['createAt'] as String),
  updateAt: json['updateAt'] == null
      ? null
      : DateTime.parse(json['updateAt'] as String),
  deleteAt: json['deleteAt'] == null
      ? null
      : DateTime.parse(json['deleteAt'] as String),
);

Map<String, dynamic> _$CaredProfileResponseToJson(
  CaredProfileResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': instance.name,
  'lastname': instance.lastname,
  'userType': instance.userType,
  'createAt': instance.createAt.toIso8601String(),
  'updateAt': instance.updateAt?.toIso8601String(),
  'deleteAt': instance.deleteAt?.toIso8601String(),
};
