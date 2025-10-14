import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/fall-service/domain/models/fall_alert_request.dart';
import 'package:apucha_watch_movil/features/fall-service/domain/models/fall_alert_response.dart';
import 'package:dio/dio.dart';

class FallService {
  final ApiClient apiClient;
  FallService(this.apiClient);

  Future<FallAlertResponse?> create(FallAlertRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/fall-alerts',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return FallAlertResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear alerta de caída: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  Future<List<FallAlertResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/fall-alerts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => FallAlertResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/fall-alerts/$id');
    } on DioException catch (e) {
      print("Error al eliminar alerta: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
