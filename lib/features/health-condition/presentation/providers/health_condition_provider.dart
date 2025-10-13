import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/health-condition/infrastructure/health_condition_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final healthConditionServiceProvider = Provider<HealthConditionService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return HealthConditionService(apiClient);
});