import 'package:json_annotation/json_annotation.dart';
part 'user_auth_response.g.dart';

@JsonSerializable()
class UserAuthResponse {
  final String id;
  //constructor
  UserAuthResponse({required this.id});

  factory UserAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$UserAuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthResponseToJson(this);
}
