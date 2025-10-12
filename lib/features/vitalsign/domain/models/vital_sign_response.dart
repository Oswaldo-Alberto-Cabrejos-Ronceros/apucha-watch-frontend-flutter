import 'package:json_annotation/json_annotation.dart';
import 'package:apucha_watch_movil/features/device/domain/models/device_minimum_response.dart';

part 'vital_sign_response.g.dart';

@JsonSerializable(explicitToJson: true)
class VitalSignResponse {
  final int id;
  final String deviceCode;
  final DateTime timeStamp;
  final int heartRate;
  final int oxygenSaturation;
  final DeviceMinimumResponse? device;

  VitalSignResponse({
    required this.id,
    required this.deviceCode,
    required this.timeStamp,
    required this.heartRate,
    required this.oxygenSaturation,
    this.device,
  });

  factory VitalSignResponse.fromJson(Map<String, dynamic> json) =>
      _$VitalSignResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSignResponseToJson(this);
}
