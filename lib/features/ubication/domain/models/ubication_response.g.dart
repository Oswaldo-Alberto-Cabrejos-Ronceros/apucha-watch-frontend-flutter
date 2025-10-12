// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ubication_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UbicationResponse _$UbicationResponseFromJson(Map<String, dynamic> json) =>
    UbicationResponse(
      id: (json['id'] as num).toInt(),
      deviceCode: json['deviceCode'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      satelites: (json['satelites'] as num).toInt(),
      hdop: (json['hdop'] as num).toDouble(),
      createAt: DateTime.parse(json['createAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      deleteAt: json['deleteAt'] == null
          ? null
          : DateTime.parse(json['deleteAt'] as String),
      device: json['device'] == null
          ? null
          : DeviceMinimumResponse.fromJson(
              json['device'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UbicationResponseToJson(UbicationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceCode': instance.deviceCode,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'satelites': instance.satelites,
      'hdop': instance.hdop,
      'createAt': instance.createAt.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'deleteAt': instance.deleteAt?.toIso8601String(),
      'device': instance.device?.toJson(),
    };
