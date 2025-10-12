import 'package:json_annotation/json_annotation.dart';
import 'package:apucha_watch_movil/features/device/domain/models/device_minimum_response.dart';

part 'ubication_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UbicationResponse {
  final int id;
  final String deviceCode;
  final DateTime timeStamp;
  final double latitude;
  final double longitude;
  final double altitude;
  final double speed;
  final int satelites;
  final double hdop;
  final DateTime createAt;
  final DateTime? updateAt;
  final DateTime? deleteAt;
  final DeviceMinimumResponse? device;

  UbicationResponse({
    required this.id,
    required this.deviceCode,
    required this.timeStamp,
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.speed,
    required this.satelites,
    required this.hdop,
    required this.createAt,
    this.updateAt,
    this.deleteAt,
    this.device,
  });

  factory UbicationResponse.fromJson(Map<String, dynamic> json) =>
      _$UbicationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UbicationResponseToJson(this);
}
