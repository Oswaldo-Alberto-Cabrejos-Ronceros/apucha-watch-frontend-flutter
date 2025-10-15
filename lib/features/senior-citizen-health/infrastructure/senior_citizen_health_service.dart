import 'dart:convert';
import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/senior-citizen-health/domain/models/senior_citizen_health_request.dart';
import 'package:apucha_watch_movil/features/senior-citizen-health/domain/models/senior_citizen_health_response.dart';
import 'package:dio/dio.dart';

class SeniorCitizenHealthService {
  final ApiClient apiClient;
  SeniorCitizenHealthService(this.apiClient);

  Future<SeniorCitizenHealthResponse?> create(SeniorCitizenHealthRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/senior-citizen-health',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = _ensureMap(response.data);
        return SeniorCitizenHealthResponse.fromJson(data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear registro senior: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  Future<List<SeniorCitizenHealthResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/senior-citizen-health');
      if (response.statusCode == 200) {
        final raw = _ensureList(response.data);
        return raw.map((json) => SeniorCitizenHealthResponse.fromJson(json as Map<String, dynamic>)).toList();
      }
      throw Exception("Error en petición: ${response.statusCode}");
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  Future<SeniorCitizenHealthResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/senior-citizen-health/$id');
      if (response.statusCode == 200) {
        final data = _ensureMap(response.data);
        return SeniorCitizenHealthResponse.fromJson(data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al obtener registro senior: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/senior-citizen-health/$id');
    } on DioException catch (e) {
      print("Error al eliminar registro senior: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  Map<String, dynamic> _ensureMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String) {
      final parsed = jsonDecode(data);
      if (parsed is Map<String, dynamic>) return parsed;
    }
    throw Exception('Invalid response format: expected Map');
  }

  List<dynamic> _ensureList(dynamic data) {
    if (data is List<dynamic>) return data;
    if (data is String) {
      final parsed = jsonDecode(data);
      if (parsed is List<dynamic>) return parsed;
    }
    throw Exception('Invalid response format: expected List');
  }
}
