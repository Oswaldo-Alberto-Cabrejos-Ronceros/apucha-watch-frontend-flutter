import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:apucha_watch_movil/features/vital_sign_alert/domain/create_vital_signs_alert_dto.dart';
import 'package:dio/dio.dart';

class VitalSignsAlertService {
  final ApiClient apiClient;

  VitalSignsAlertService(this.apiClient);

  Future<List<CreateVitalSignsAlertDto>> findAllBySeniorId(int seniorId) async {
    try {
      final response = await apiClient.dio.get('/vital-signs-alert/$seniorId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data);
        return data
            .map((json) => CreateVitalSignsAlertDto.fromJson(json))
            .toList();
      } else {
        throw Exception("Error en petición: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error en petición: ${e.response?.data ?? e.message}");
    }
  }
}
