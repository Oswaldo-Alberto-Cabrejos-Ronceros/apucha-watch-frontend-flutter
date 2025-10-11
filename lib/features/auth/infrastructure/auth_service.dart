import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/auth/domain/models/auth_response.dart';
import 'package:apucha_watch_movil/features/auth/domain/models/register_request.dart';
import 'package:dio/dio.dart';

class AuthService {
  final ApiClient apiClient;

  AuthService(this.apiClient);

  //for login
  Future<String?> login(String email, String password) async {
    try {
      final response = await apiClient.dio.post(
        "/auth/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final authResponse = AuthResponse.fromJson(response.data);
        //guardamos token
        final accessToken = authResponse.session.access_token;
        apiClient.setToken(accessToken);
        return accessToken;
      }
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
    }
    return null;
  }

  //for register
  Future<String?> register(RegisterRequest registerRequest) async {
    try {
      final response = await apiClient.dio.post(
        'auth/signup',
        data: registerRequest.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final authResponse = AuthResponse.fromJson(response.data);
        //guardamos token
        final accessToken = authResponse.session.access_token;
        apiClient.setToken(accessToken);
        return accessToken;
      }
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en register: ${e.response?.data ?? e.message}");
    }
    return null;
  }

  Future<void> logout() async {
    apiClient.clearToken();
  }
}
