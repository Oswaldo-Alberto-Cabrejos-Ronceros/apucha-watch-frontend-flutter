// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_health_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenHealthResponse _$SeniorCitizenHealthResponseFromJson(
        Map<String, dynamic> json) =>
    SeniorCitizenHealthResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      heartRate: json['heartRate'] as int,
      systolic: json['systolic'] as int,
      diastolic: json['diastolic'] as int,
      glucoseLevel: json['glucoseLevel'] as int?,
      fallDetected: json['fallDetected'] as bool,
      medicationTaken: json['medicationTaken'] as bool,
      timeStamp: SeniorCitizenHealthResponse._fromJson(json['timeStamp']),
      deviceId: json['deviceId'] as int?,
      currentProfileId: json['currentProfileId'] as int?,
    );

Map<String, dynamic> _$SeniorCitizenHealthResponseToJson(
        SeniorCitizenHealthResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'heartRate': instance.heartRate,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'glucoseLevel': instance.glucoseLevel,
      'fallDetected': instance.fallDetected,
      'medicationTaken': instance.medicationTaken,
      'timeStamp': SeniorCitizenHealthResponse._toJson(instance.timeStamp),
      'deviceId': instance.deviceId,
      'currentProfileId': instance.currentProfileId,
    };
