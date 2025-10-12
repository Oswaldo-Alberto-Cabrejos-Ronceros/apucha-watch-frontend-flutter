import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/senior_citizen_profile_response.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/senior_citizen_request.dart';
import 'package:dio/dio.dart';

class SeniorCitizenProfileService {
  final ApiClient apiClient;
  SeniorCitizenProfileService(this.apiClient);

  //create
  Future<SeniorCitizenProfileResponse?> create(
    SeniorCitizenRequest seniorCitizenRequest,
  ) async {
    try {
      print('Creating senior citizen with data: ${seniorCitizenRequest.toJson()}');
      final response = await apiClient.dio.post(
        '/senior-citizen-profile',
        data: seniorCitizenRequest.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SeniorCitizenProfileResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en crear ${e.response?.data ?? e.message}");
      return null;
    }
  }

  //get all
  Future<List<SeniorCitizenProfileResponse>> findAll() async {
    try {
      final response = await apiClient.dio.get('/senior-citizen-profile');
      if (response.statusCode == 200) {
        //lista
        final List<dynamic> data = response.data;
        return data
            .map((json) => SeniorCitizenProfileResponse.fromJson(json))
            .toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  //find by id
  Future<SeniorCitizenProfileResponse?> findOne(int id) async {
    try {
      final response = await apiClient.dio.get('/senior-citizen-profile/$id');
      if (response.statusCode == 200) {
        return SeniorCitizenProfileResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
      return null;
    }
  }

  //update

  Future<SeniorCitizenProfileResponse?> update(
    int id,
    SeniorCitizenRequest seniorCitizenRequest,
  ) async {
    try {
      final response = await apiClient.dio.put(
        '/senior-citizen-profile/$id',
        data: seniorCitizenRequest.toJson(),
      );
      if (response.statusCode == 200) {
        return SeniorCitizenProfileResponse.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
      return null;
    }
  }

  //for delete
  Future<void> delete(int id) async {
    try {
      await apiClient.dio.delete('/senior-citizen-profile/$id');
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }

  //restore
  Future<void> restore(int id) async {
    try {
      await apiClient.dio.patch('/senior-citizen-profile/$id');
    } on DioException catch (e) {
      // ignore: avoid_print
      print("Error en login ${e.response?.data ?? e.message}");
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
