import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/fall-service/domain/models/fall_alert_request.dart';
import 'package:apucha_watch_movil/features/fall-service/domain/models/fall_alert_response.dart';
import 'package:apucha_watch_movil/features/fall-service/domain/models/fall_alert_response.dart'
    show Fall, Ubication;
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

  Future<void> delete(dynamic id) async {
    try {
      await apiClient.dio.delete('/fall-alerts/$id');
    } on DioException catch (e) {
      print("Error al eliminar alerta: ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }


  Future<Fall> getFallById(String id) async {
    try {
      final response = await apiClient.dio.get('/falls/$id');
      if (response.statusCode == 200) {
        return Fall.fromJson(response.data as Map<String, dynamic>);
      }
      throw Exception('Error fetching fall: ${response.statusCode}');
    } on DioException catch (e) {
      throw Exception('Error fetching fall: ${e.response?.data ?? e.message}');
    }
  }

  Future<List<Fall>> getFallsForDevice(String deviceCode) async {
    try {
      final response = await apiClient.dio.get('/falls', queryParameters: {'deviceCode': deviceCode});
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data as List<dynamic>;
        return list.map((e) => Fall.fromJson(e as Map<String, dynamic>)).toList();
      }
      throw Exception('Error fetching falls: ${response.statusCode}');
    } on DioException catch (e) {
      throw Exception('Error fetching falls: ${e.response?.data ?? e.message}');
    }
  }

  Future<List<Ubication>> getUbicationsForDeviceRange(
      String deviceCode, DateTime from, DateTime to) async {
    try {
      final fromS = from.toUtc().toIso8601String();
      final toS = to.toUtc().toIso8601String();
      final response = await apiClient.dio.get(
        '/ubications',
        queryParameters: {'deviceCode': deviceCode, 'from': fromS, 'to': toS},
      );
      if (response.statusCode == 200) {
        final List<dynamic> list = response.data as List<dynamic>;
        return list.map((e) => Ubication.fromJson(e as Map<String, dynamic>)).toList();
      }
      throw Exception('Error fetching ubications: ${response.statusCode}');
    } on DioException catch (e) {
      throw Exception('Error fetching ubications: ${e.response?.data ?? e.message}');
    }
  }
}
