import 'package:json_annotation/json_annotation.dart';

part 'vital_sign_request.g.dart';

@JsonSerializable()
class VitalSignRequest {
  final String deviceCode;
  final int heartRate;
  final int oxygenSaturation;

  VitalSignRequest({
    required this.deviceCode,
    required this.heartRate,
    required this.oxygenSaturation,
  });

  factory VitalSignRequest.fromJson(Map<String, dynamic> json) =>
      _$VitalSignRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSignRequestToJson(this);
}
