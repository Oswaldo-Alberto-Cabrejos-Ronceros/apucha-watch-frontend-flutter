import 'package:json_annotation/json_annotation.dart';
part 'device_minimun_response.g.dart';

@JsonSerializable()
class DeviceMininumResponse {
  final int id;
  DeviceMininumResponse({required this.id});

  factory DeviceMininumResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceMininumResponseFromJson(json);
      
  Map<String, dynamic> toJson() => _$DeviceMininumResponseToJson(this);
}
