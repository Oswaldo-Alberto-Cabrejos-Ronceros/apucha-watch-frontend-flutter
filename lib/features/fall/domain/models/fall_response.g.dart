// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fall_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FallResponse _$FallResponseFromJson(Map<String, dynamic> json) => FallResponse(
  id: (json['id'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$FallResponseToJson(FallResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
    };
