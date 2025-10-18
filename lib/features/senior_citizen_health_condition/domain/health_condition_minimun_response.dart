import 'package:json_annotation/json_annotation.dart';
part 'health_condition_minimun_response.g.dart';

@JsonSerializable()
class HealthConditionMinimunResponse {
  final int id;

  HealthConditionMinimunResponse({required this.id});

  factory HealthConditionMinimunResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthConditionMinimunResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HealthConditionMinimunResponseToJson(this);
}
