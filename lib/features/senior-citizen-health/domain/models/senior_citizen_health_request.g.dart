// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_citizen_health_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeniorCitizenHealthRequest _$SeniorCitizenHealthRequestFromJson(
        Map<String, dynamic> json) =>
    SeniorCitizenHealthRequest(
      name: json['name'] as String,
      age: json['age'] as int,
      heartRate: json['heartRate'] as int,
      systolic: json['systolic'] as int,
      diastolic: json['diastolic'] as int,
      glucoseLevel: json['glucoseLevel'] as int?,
      fallDetected: json['fallDetected'] as bool,
      medicationTaken: json['medicationTaken'] as bool,
      timeStamp: SeniorCitizenHealthRequest._fromJson(json['timeStamp']),
      deviceId: json['deviceId'] as int?,
      currentProfileId: json['currentProfileId'] as int?,
    );

Map<String, dynamic> _$SeniorCitizenHealthRequestToJson(
        SeniorCitizenHealthRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'heartRate': instance.heartRate,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'glucoseLevel': instance.glucoseLevel,
      'fallDetected': instance.fallDetected,
      'medicationTaken': instance.medicationTaken,
      'timeStamp': SeniorCitizenHealthRequest._toJson(instance.timeStamp),
      'deviceId': instance.deviceId,
      'currentProfileId': instance.currentProfileId,
    };
