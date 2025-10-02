import 'package:apucha_watch_movil/features/auth/domain/models/session_auth_response.dart';
import 'package:apucha_watch_movil/features/auth/domain/models/user_auth_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final UserAuthResponse user;
  final SessionAuthResponse session;
  AuthResponse({required this.user, required this.session});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
