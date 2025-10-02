import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/domain/models/cared_senior_citizen_request.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/domain/models/cared_senior_citizen_response.dart';
import 'package:dio/dio.dart';

class CaredSeniorCitizenService {
  final ApiClient apiClient;
  CaredSeniorCitizenService(this.apiClient);

  //for create
  Future<CaredSeniorCitizenResponse?> create(
    CaredSeniorCitizenRequest caredSeniorCitizenRequest,
  ) async {
    try {
      final response = await apiClient.dio.post(
        '/cared-senior-citizen',
        data: caredSeniorCitizenRequest.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CaredSeniorCitizenResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
      return null;
    }
  }
  //for return all

  Future<List<CaredSeniorCitizenResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/cared-senior-citizen');
      if (response.statusCode == 200) {
        //lista
        final List<dynamic> data = response.data;
        return data
            .map((json) => CaredSeniorCitizenResponse.fromJson(json))
            .toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  //for find one

  Future<CaredSeniorCitizenResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/cared-senior-citizen/$id');
      if (response.statusCode == 200) {
        return CaredSeniorCitizenResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
      return null;
    }
  }

  //for delete relation

  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/cared-senior-citizen/$id');
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  // for get all relations for caredProfile

  Future<List<CaredSeniorCitizenResponse>> getAllByCaredProfileId(
    int caredProfileId,
  ) async {
    try {
      final response = await apiClient.dio.get(
        '/cared-senior-citizen/cared-profile/$caredProfileId',
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((json) => CaredSeniorCitizenResponse.fromJson(json))
            .toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
