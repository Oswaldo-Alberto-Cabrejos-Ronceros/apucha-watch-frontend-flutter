import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/fall/domain/models/fall_response.dart';
import 'package:dio/dio.dart';

class FallService {
  final ApiClient apiClient;
  FallService(this.apiClient);

  Future<List<FallResponse>> getFallHistory(int seniorCitizienId) async {
    try {
      final response = await apiClient.dio.get('/fall/$seniorCitizienId');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => FallResponse.fromJson(json)).toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
