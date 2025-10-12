import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_request.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_response.dart';
import 'package:dio/dio.dart';

class CaredProfileService {
  final ApiClient apiClient;
  CaredProfileService(this.apiClient);

  // Create
  Future<CaredProfileResponse?> create(CaredProfileRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/cared-profile',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CaredProfileResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear perfil cuidado: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<CaredProfileResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/cared-profile');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => CaredProfileResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<CaredProfileResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/cared-profile/$id');
      if (response.statusCode == 200) {
        return CaredProfileResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al obtener perfil cuidado: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Update
  Future<CaredProfileResponse?> update(
      int id, CaredProfileRequest request) async {
    try {
      final response = await apiClient.dio.patch(
        '/cared-profile/$id',
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return CaredProfileResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al actualizar perfil cuidado: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/cared-profile/$id');
    } on DioException catch (e) {
      print("Error al eliminar perfil cuidado: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  // Restore
  Future<void> restore(int id) async {
    try {
      await apiClient.dio.patch('/cared-profile/restore/$id');
    } on DioException catch (e) {
      print("Error al restaurar perfil cuidado: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
