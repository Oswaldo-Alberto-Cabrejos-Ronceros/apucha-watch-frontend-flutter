import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/health-condition-recommendation/domain/models/health_condition_recommendation_request.dart';
import 'package:apucha_watch_movil/features/health-condition-recommendation/domain/models/health_condition_recommendation_response.dart';
import 'package:dio/dio.dart';

class HealthConditionRecommendationService {
  final ApiClient apiClient;
  HealthConditionRecommendationService(this.apiClient);

  // Create
  Future<HealthConditionRecommendationResponse?> create(
    HealthConditionRecommendationRequest request,
  ) async {
    try {
      final response = await apiClient.dio.post(
        '/health-condition-recommendations',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HealthConditionRecommendationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear recomendación-condición: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<HealthConditionRecommendationResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/health-condition-recommendations');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((json) => HealthConditionRecommendationResponse.fromJson(json))
            .toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(
        "Error al obtener recomendaciones-condición: ${e.response?.data ?? e.message}",
      );
    }
  }

  // Find one
  Future<HealthConditionRecommendationResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/health-condition-recommendations/$id');
      if (response.statusCode == 200) {
        return HealthConditionRecommendationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al obtener recomendación-condición: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Update
  Future<HealthConditionRecommendationResponse?> update(
    int id,
    HealthConditionRecommendationRequest request,
  ) async {
    try {
      final response = await apiClient.dio.put(
        '/health-condition-recommendations/$id',
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return HealthConditionRecommendationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al actualizar recomendación-condición: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/health-condition-recommendations/$id');
    } on DioException catch (e) {
      print("Error al eliminar recomendación-condición: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}