// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ubication_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UbicationRequest _$UbicationRequestFromJson(Map<String, dynamic> json) =>
    UbicationRequest(
      deviceCode: json['deviceCode'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num).toDouble(),
      speed: (json['speed'] as num).toDouble(),
      satelites: (json['satelites'] as num).toInt(),
      hdop: (json['hdop'] as num).toDouble(),
    );

Map<String, dynamic> _$UbicationRequestToJson(UbicationRequest instance) =>
    <String, dynamic>{
      'deviceCode': instance.deviceCode,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'satelites': instance.satelites,
      'hdop': instance.hdop,
    };
