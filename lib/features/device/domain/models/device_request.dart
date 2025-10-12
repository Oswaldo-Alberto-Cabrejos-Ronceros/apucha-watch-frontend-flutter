import 'package:json_annotation/json_annotation.dart';
part 'device_request.g.dart';

@JsonSerializable()
class DeviceRequest {
  final String code;

  DeviceRequest({
    required this.code,
  });

  factory DeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceRequestToJson(this);
}
