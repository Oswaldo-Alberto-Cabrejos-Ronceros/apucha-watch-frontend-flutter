import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/health-recommendation/infrastructure/health_recommendation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final healthRecommendationServiceProvider =
    Provider<HealthRecommendationService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return HealthRecommendationService(apiClient);
});