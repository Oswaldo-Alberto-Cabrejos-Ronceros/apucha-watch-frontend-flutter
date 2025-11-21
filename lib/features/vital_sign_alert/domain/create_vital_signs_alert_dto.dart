import 'package:json_annotation/json_annotation.dart';

part 'create_vital_signs_alert_dto.g.dart';

@JsonSerializable()
class CreateVitalSignsAlertDto {
  final int id;
  final String type;
  final String severity;
  final DateTime timestamp;

  CreateVitalSignsAlertDto({
    required this.id,
    required this.type,
    required this.severity,
    required this.timestamp
  });

  factory CreateVitalSignsAlertDto.fromJson(Map<String, dynamic> json) =>
      _$CreateVitalSignsAlertDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateVitalSignsAlertDtoToJson(this);
}
