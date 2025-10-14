import 'package:json_annotation/json_annotation.dart';
part 'device_minimun_response.g.dart';

@JsonSerializable()
class DeviceMininumResponse {
  final int id;
  final String? code;
  DeviceMininumResponse({required this.id,required this.code});

  factory DeviceMininumResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceMininumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceMininumResponseToJson(this);
}
