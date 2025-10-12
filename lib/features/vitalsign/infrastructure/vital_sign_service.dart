import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/vitalsign/domain/models/vital_sign_request.dart';
import 'package:apucha_watch_movil/features/vitalsign/domain/models/vital_sign_response.dart';
import 'package:dio/dio.dart';

class VitalSignService {
  final ApiClient apiClient;
  VitalSignService(this.apiClient);

  // Create
  Future<VitalSignResponse?> create(VitalSignRequest request) async {
    try {
      final response = await apiClient.dio.post(
        '/vital-signs',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return VitalSignResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error al crear signo vital: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // Find all
  Future<List<VitalSignResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/vital-signs');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => VitalSignResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error al obtener signos vitales: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<VitalSignResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/vital-signs/$id');
      if (response.statusCode == 200) {
        return VitalSignResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error al obtener signo vital: ${e.response?.data ?? e.message}");
      return null;
    }
  }
}