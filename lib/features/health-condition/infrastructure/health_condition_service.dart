import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/health-condition/domain/models/health_condition_request.dart';
import 'package:apucha_watch_movil/features/health-condition/domain/models/health_condition_response.dart';
import 'package:dio/dio.dart';

class HealthConditionService {
  final ApiClient apiClient;
  HealthConditionService(this.apiClient);

  // Create
  Future<HealthConditionResponse?> create(HealthConditionRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/health-conditions',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HealthConditionResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear condición de salud: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<HealthConditionResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/health-conditions');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => HealthConditionResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error al obtener condiciones: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<HealthConditionResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/health-conditions/$id');
      if (response.statusCode == 200) {
        return HealthConditionResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al obtener condición: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Update
  Future<HealthConditionResponse?> update(int id, HealthConditionRequest request) async {
    try {
      final response = await apiClient.dio.put(
        '/health-conditions/$id',
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return HealthConditionResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al actualizar condición: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/health-conditions/$id');
    } on DioException catch (e) {
      print("Error al eliminar condición: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}