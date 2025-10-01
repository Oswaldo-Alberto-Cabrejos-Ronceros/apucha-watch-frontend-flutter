import 'package:json_annotation/json_annotation.dart';
part 'session_auth_response.g.dart';

@JsonSerializable()
class SessionAuthResponse {
  // ignore: non_constant_identifier_names
  final String access_token;
  //constructur
  // ignore: non_constant_identifier_names
  SessionAuthResponse({required this.access_token});
  factory SessionAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionAuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SessionAuthResponseToJson(this);
}
