import 'package:json_annotation/json_annotation.dart';

part 'ubication_request.g.dart';

@JsonSerializable()
class UbicationRequest {
  final String deviceCode;
  final DateTime timeStamp;
  final double latitude;
  final double longitude;
  final double altitude;
  final double speed;
  final int satelites;
  final double hdop;

  UbicationRequest({
    required this.deviceCode,
    required this.timeStamp,
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.speed,
    required this.satelites,
    required this.hdop,
  });

  factory UbicationRequest.fromJson(Map<String, dynamic> json) =>
      _$UbicationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UbicationRequestToJson(this);
}
