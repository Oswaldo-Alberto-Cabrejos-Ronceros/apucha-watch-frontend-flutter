import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/device/domain/models/device_request.dart';
import 'package:apucha_watch_movil/features/device/domain/models/device_response.dart';
import 'package:dio/dio.dart';

class DeviceService {
  final ApiClient apiClient;
  DeviceService(this.apiClient);

  // Create
  Future<DeviceResponse?> create(DeviceRequest deviceRequest) async {
    try {
      final response = await apiClient.dio.post(
        '/devices',
        data: deviceRequest.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DeviceResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error al crear dispositivo: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<DeviceResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/devices');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => DeviceResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<DeviceResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/devices/$id');
      if (response.statusCode == 200) {
        return DeviceResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error al obtener dispositivo: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/devices/$id');
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error al eliminar dispositivo: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
