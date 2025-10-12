import 'package:json_annotation/json_annotation.dart';

part 'cared_profile_request.g.dart';

@JsonSerializable()
class CaredProfileRequest {
  final String userId;
  final String name;
  final String lastname;

  CaredProfileRequest({
    required this.userId,
    required this.name,
    required this.lastname,
  });

  factory CaredProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$CaredProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CaredProfileRequestToJson(this);
}
