// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  user: UserAuthResponse.fromJson(json['user'] as Map<String, dynamic>),
  session: SessionAuthResponse.fromJson(
    json['session'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{'user': instance.user, 'session': instance.session};
