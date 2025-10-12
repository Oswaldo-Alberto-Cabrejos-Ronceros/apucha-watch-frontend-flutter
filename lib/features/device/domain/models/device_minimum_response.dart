import 'package:json_annotation/json_annotation.dart';
part 'device_minimum_response.g.dart';

@JsonSerializable()
class DeviceMinimumResponse {
  final int id;
  DeviceMinimumResponse({
    required this.id,
  });

  factory DeviceMinimumResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceMinimumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceMinimumResponseToJson(this);
}
