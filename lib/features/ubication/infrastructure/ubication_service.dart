import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/device/domain/models/ubication_request.dart';
import 'package:apucha_watch_movil/features/device/domain/models/ubication_response.dart';
import 'package:dio/dio.dart';

class UbicationService {
  final ApiClient apiClient;
  UbicationService(this.apiClient);

  // Create
  Future<UbicationResponse?> create(UbicationRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/ubications',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UbicationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al crear ubicación: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<UbicationResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/ubications');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => UbicationResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error al obtener ubicaciones: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<UbicationResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/ubications/$id');
      if (response.statusCode == 200) {
        return UbicationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al obtener ubicación: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Update
  Future<UbicationResponse?> update(int id, UbicationRequest request) async {
    try {
      final response = await apiClient.dio.patch(
        '/ubications/$id',
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return UbicationResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      print("Error al actualizar ubicación: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/ubications/$id');
    } on DioException catch (e) {
      print("Error al eliminar ubicación: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
