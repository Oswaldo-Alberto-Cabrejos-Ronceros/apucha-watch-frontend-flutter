import 'package:apucha_watch_movil/features/vital_signs_sumary/domain/vital_signs_stats.dart';
import 'package:dio/dio.dart';
import 'package:apucha_watch_movil/core/api_client/api_client.dart';

class VitalSignsStatsService {
  final ApiClient apiClient;

  VitalSignsStatsService(this.apiClient);

  Future<VitalSignsStats?> findAllByDayForStats(
    String deviceCode,
    DateTime day,
  ) async {
    try {
      final response = await apiClient.dio.get(
        '/vital-signs-summary/dayStats/$deviceCode/$day',
      );
      print('/vital-signs-summary/dayStats/$deviceCode/$day');
      if (response.statusCode == 200) {
        print(response.data);
        return VitalSignsStats.fromJson(response.data);
      }

      return null;
    } on DioException catch (e) {
      print("Error al obtener estadísticas: ${e.response?.data ?? e.message}");
      return null;
    }
  }
}
