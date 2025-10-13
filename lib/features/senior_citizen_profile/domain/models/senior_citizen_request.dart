import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_request.g.dart';

@JsonSerializable()
class SeniorCitizenRequest {
  final String name;
  final String lastname;
  final String birthdate;
  final int deviceId;
  SeniorCitizenRequest({
    required this.name,
    required this.lastname,
    required this.birthdate,
    required this.deviceId,
  });
    factory SeniorCitizenRequest.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenRequestFromJson(json);
      
  Map<String, dynamic> toJson() => _$SeniorCitizenRequestToJson(this);
}
