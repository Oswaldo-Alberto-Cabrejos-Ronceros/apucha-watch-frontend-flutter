import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/device_minimun_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_profile_response.g.dart';

@JsonSerializable()
class SeniorCitizenProfileResponse {
  final int id;
  final String name;
  final String lastname;
  final DateTime birthdate;
  final DeviceMininumResponse device;
  final DateTime createAt;
  final DateTime? updateAt;
  final DateTime? deleteAt;

  SeniorCitizenProfileResponse({
    required this.id,
    required this.name,
    required this.lastname,
    required this.birthdate,
    required this.device,
    required this.createAt,
    this.updateAt,
    this.deleteAt,
  });

  factory SeniorCitizenProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SeniorCitizenProfileResponseToJson(this);
}
