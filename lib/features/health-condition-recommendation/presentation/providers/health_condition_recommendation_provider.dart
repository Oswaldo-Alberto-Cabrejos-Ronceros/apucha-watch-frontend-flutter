import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/health-condition-recommendation/infrastructure/health_condition_recommendation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final healthConditionRecommendationServiceProvider =
    Provider<HealthConditionRecommendationService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return HealthConditionRecommendationService(apiClient);
});