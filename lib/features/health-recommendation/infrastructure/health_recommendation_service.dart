import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/health-recommendation/domain/models/health_recommendation_request.dart';
import 'package:apucha_watch_movil/features/health-recommendation/domain/models/health_recommendation_response.dart';
import 'package:dio/dio.dart';

class HealthRecommendationService {
  final ApiClient apiClient;
  HealthRecommendationService(this.apiClient);

  // Create
  Future<HealthRecommendationResponse?> create(HealthRecommendationRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/health-recommendations',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HealthRecommendationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear recomendación: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<HealthRecommendationResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/health-recommendations');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => HealthRecommendationResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<HealthRecommendationResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/health-recommendations/$id');
      if (response.statusCode == 200) {
        return HealthRecommendationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al obtener recomendación: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/health-recommendations/$id');
    } on DioException catch (e) {
      print("Error al eliminar recomendación: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}