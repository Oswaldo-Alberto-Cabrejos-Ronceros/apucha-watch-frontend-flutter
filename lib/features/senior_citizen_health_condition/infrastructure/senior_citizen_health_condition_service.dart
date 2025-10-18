import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/senior_citizen_health_condition/domain/senior_citizen_health_condition_request.dart';
import 'package:apucha_watch_movil/features/senior_citizen_health_condition/domain/senior_citizen_health_condition_response.dart';
import 'package:apucha_watch_movil/features/senior_citizen_health_condition/domain/senior_citizen_health_condition_update_request.dart';
import 'package:dio/dio.dart';

class SeniorCitizenHealthConditionService {
  final ApiClient apiClient;
  SeniorCitizenHealthConditionService(this.apiClient);

  //create
  Future<SeniorCitizenHealthConditionResponse?> create(
    SeniorCitizenHealthConditionRequest request,
  ) async {
    try {
      final response = await apiClient.dio.post(
        '/senior-citizen-health-condition',
        data: request.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SeniorCitizenHealthConditionResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print(
        "Error al crear senior citizen health condition: ${e.response?.data ?? e.message}",
      );
      return null;
    }
  }

  //find all
  Future<List<SeniorCitizenHealthConditionResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get(
        '/senior-citizen-health-condition',
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((json) => SeniorCitizenHealthConditionResponse.fromJson(json))
            .toList();
      } else {
        throw Exception('Error en peticion: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  // Find one
  Future<SeniorCitizenHealthConditionResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get(
        '/senior-citizen-health-condition/$id',
      );
      if (response.statusCode == 200) {
        return SeniorCitizenHealthConditionResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print(
        "Error al obtener senior citizen health condition: ${e.response?.data ?? e.message}",
      );
      return null;
    }
  }

  // Update
  Future<SeniorCitizenHealthConditionResponse?> update(
    int id,
    SeniorCitizenHealthConditionUpdateRequest request,
  ) async {
    try {
      final response = await apiClient.dio.patch(
        '/senior-citizen-health-condition/$id',
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return SeniorCitizenHealthConditionResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print(
        "Error al actualizar senior citizen health condition: ${e.response?.data ?? e.message}",
      );
      return null;
    }
  }

  // Delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/senior-citizen-health-condition/$id');
    } on DioException catch (e) {
      // ignore: avoid_print
      print(
        "Error al eliminar senior citizen health condition: ${e.response?.data ?? e.message}",
      );
      throw Exception(
        "Error en petición citizen health condition: ${e.response?.data ?? e.message}",
      );
    }
  }
}
