import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/senior-citizen-health/domain/models/senior_citizen_health_request.dart';
import 'package:apucha_watch_movil/features/senior-citizen-health/domain/models/senior_citizen_health_response.dart';
import 'package:dio/dio.dart';

class SeniorCitizenHealthService {
  final ApiClient apiClient;
  SeniorCitizenHealthService(this.apiClient);

  // Create
  Future<SeniorCitizenHealthResponse?> create(SeniorCitizenHealthRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/senior-citizen-health',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SeniorCitizenHealthResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear condición de salud: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<SeniorCitizenHealthResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/senior-citizen-health');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => SeniorCitizenHealthResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<SeniorCitizenHealthResponse?> findOne(String id) async {
    try {
      final response = await apiClient.dio.get('/senior-citizen-health/$id');
      if (response.statusCode == 200) {
        return SeniorCitizenHealthResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al obtener condición: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Delete
  Future<void> delete(String id) async {
    try {
      await apiClient.dio.delete('/senior-citizen-health/$id');
    } on DioException catch (e) {
      print("Error al eliminar condición: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
