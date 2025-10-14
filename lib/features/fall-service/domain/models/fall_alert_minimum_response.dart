import 'package:json_annotation/json_annotation.dart';

part 'fall_alert_minimum_response.g.dart';

@JsonSerializable()
class FallAlertMinimumResponse {
  final String id;

  FallAlertMinimumResponse({required this.id});

  factory FallAlertMinimumResponse.fromJson(Map<String, dynamic> json) =>
      _$FallAlertMinimumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FallAlertMinimumResponseToJson(this);
}
