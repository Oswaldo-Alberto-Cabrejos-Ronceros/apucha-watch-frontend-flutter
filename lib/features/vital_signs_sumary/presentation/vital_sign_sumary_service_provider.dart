import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/vital_signs_sumary/infrastructure/vital_signs_stats_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vitalSignsStatsServiceProvider = Provider<VitalSignsStatsService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return VitalSignsStatsService(apiClient);
});