import 'package:json_annotation/json_annotation.dart';

part 'vital_sign_minimun_response.g.dart';

@JsonSerializable()
class VitalSignMinimunResponse {
  final int heartRate;
  final int oxygenSaturation;

  VitalSignMinimunResponse({
    required this.heartRate,
    required this.oxygenSaturation,
  });
    factory VitalSignMinimunResponse.fromJson(Map<String, dynamic> json) =>
      _$VitalSignMinimunResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VitalSignMinimunResponseToJson(this);
}
