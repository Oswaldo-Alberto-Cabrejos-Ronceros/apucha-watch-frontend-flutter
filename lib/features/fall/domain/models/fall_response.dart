import 'package:json_annotation/json_annotation.dart';

part 'fall_response.g.dart';

@JsonSerializable()
class FallResponse {
  final int id;
  final DateTime timestamp;
  //relations
  FallResponse({required this.id, required this.timestamp});
  factory FallResponse.fromJson(Map<String, dynamic> json) =>
      _$FallResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FallResponseToJson(this);
}
