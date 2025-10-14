import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/senior-citizen-health/infrastructure/senior_citizen_health_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seniorCitizenHealthServiceProvider =
    Provider<SeniorCitizenHealthService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return SeniorCitizenHealthService(apiClient);
});
