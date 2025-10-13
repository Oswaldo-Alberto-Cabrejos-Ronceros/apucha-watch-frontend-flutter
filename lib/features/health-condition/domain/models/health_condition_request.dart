import 'package:json_annotation/json_annotation.dart';

part 'health_condition_request.g.dart';

@JsonSerializable()
class HealthConditionRequest {
  final String name;

  HealthConditionRequest({required this.name});

  factory HealthConditionRequest.fromJson(Map<String, dynamic> json) =>
      _$HealthConditionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HealthConditionRequestToJson(this);
}