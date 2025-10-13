import 'package:json_annotation/json_annotation.dart';

part 'cared_profile_response.g.dart';

@JsonSerializable()
class CaredProfileResponse {
  final int id;
  final String userId;
  final String name;
  final String lastname;
  final String userType;
  final DateTime createAt;
  final DateTime? updateAt;
  final DateTime? deleteAt;

  CaredProfileResponse({
    required this.id,
    required this.userId,
    required this.name,
    required this.lastname,
    required this.userType,
    required this.createAt,
    this.updateAt,
    this.deleteAt,
  });

  factory CaredProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CaredProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CaredProfileResponseToJson(this);
}
