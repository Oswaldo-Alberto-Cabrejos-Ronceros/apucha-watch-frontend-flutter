import 'package:json_annotation/json_annotation.dart';

part 'assing_token_device_request.g.dart';

@JsonSerializable()
class AssingTokenDeviceRequest {
  final String userId;
  final String deviceToken;

  AssingTokenDeviceRequest({required this.userId, required this.deviceToken});

  factory AssingTokenDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$AssingTokenDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AssingTokenDeviceRequestToJson(this);
}
