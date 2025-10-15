// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fall_alert_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccelerationSchema _$AccelerationSchemaFromJson(Map<String, dynamic> json) =>
    AccelerationSchema(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$AccelerationSchemaToJson(
        AccelerationSchema instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

GyroscopeSchema _$GyroscopeSchemaFromJson(Map<String, dynamic> json) =>
    GyroscopeSchema(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$GyroscopeSchemaToJson(GyroscopeSchema instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

Ubication _$UbicationFromJson(Map<String, dynamic> json) => Ubication(
      id: json['id'] as String,
      deviceCode: json['deviceCode'] as String,
      timeStamp: Ubication._fromJsonTS(json['timeStamp']),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      satellites: json['satellites'] as int?,
      hdop: (json['hdop'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UbicationToJson(Ubication instance) => <String, dynamic>{
      'id': instance.id,
      'deviceCode': instance.deviceCode,
      'timeStamp': Ubication._toJsonTS(instance.timeStamp),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'satellites': instance.satellites,
      'hdop': instance.hdop,
    };

Fall _$FallFromJson(Map<String, dynamic> json) => Fall(
      id: json['id'] as String,
      deviceCode: json['deviceCode'] as String,
      timeStamp: Fall._fromJsonTS(json['timeStamp']),
      acceleration: AccelerationSchema.fromJson(
          json['acceleration'] as Map<String, dynamic>),
      gyroscope:
          GyroscopeSchema.fromJson(json['gyroscope'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FallToJson(Fall instance) => <String, dynamic>{
      'id': instance.id,
      'deviceCode': instance.deviceCode,
      'timeStamp': Fall._toJsonTS(instance.timeStamp),
      'acceleration': instance.acceleration.toJson(),
      'gyroscope': instance.gyroscope.toJson(),
    };

FallAlertResponse _$FallAlertResponseFromJson(Map<String, dynamic> json) =>
    FallAlertResponse(
      id: json['id'] as String,
      userId: json['userId'] as String,
      deviceCode: json['deviceCode'] as String?,
      timestamp: FallAlertResponse._fromJsonTS2(json['timestamp']),
      fallDetected: json['fallDetected'] as bool,
      severity: FallAlertResponse._severityFromJson(json['severity']),
      fall: json['fall'] == null
          ? null
          : Fall.fromJson(json['fall'] as Map<String, dynamic>),
      ubication: json['ubication'] == null
          ? null
          : Ubication.fromJson(json['ubication'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FallAlertResponseToJson(FallAlertResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'deviceCode': instance.deviceCode,
      'timestamp': FallAlertResponse._toJsonTS2(instance.timestamp),
      'fallDetected': instance.fallDetected,
      'severity': FallAlertResponse._severityToJson(instance.severity),
      'fall': instance.fall?.toJson(),
      'ubication': instance.ubication?.toJson(),
    };

