import 'package:json_annotation/json_annotation.dart';
import 'package:apucha_watch_movil/features/device/domain/models/ubication_response.dart';
import 'package:apucha_watch_movil/features/device/domain/models/vital_sign_response.dart';

part 'device_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DeviceResponse {
  final int id;
  final String code;
  final DateTime createAt;
  final DateTime? updateAt;
  final DateTime? deleteAt;
  final List<UbicationResponse>? ubications;
  final List<VitalSignResponse>? vitalSigns;

  DeviceResponse({
    required this.id,
    required this.code,
    required this.createAt,
    this.updateAt,
    this.deleteAt,
    this.ubications,
    this.vitalSigns,
  });

  factory DeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceResponseToJson(this);
}
