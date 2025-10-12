// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceResponse _$DeviceResponseFromJson(Map<String, dynamic> json) =>
    DeviceResponse(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      deleteAt: json['deleteAt'] == null
          ? null
          : DateTime.parse(json['deleteAt'] as String),
      ubications: (json['ubications'] as List<dynamic>?)
          ?.map((e) => UbicationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      vitalSigns: (json['vitalSigns'] as List<dynamic>?)
          ?.map((e) => VitalSignResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeviceResponseToJson(DeviceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'createAt': instance.createAt.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'deleteAt': instance.deleteAt?.toIso8601String(),
      'ubications': instance.ubications?.map((e) => e.toJson()).toList(),
      'vitalSigns': instance.vitalSigns?.map((e) => e.toJson()).toList(),
    };
