import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/senior_citizen_health_condition/infrastructure/senior_citizen_health_condition_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seniorCitizenHealthConditionProvider =
    Provider<SeniorCitizenHealthConditionService>((ref) {
      final apiClient = ref.read(apiClientProvider);
      return SeniorCitizenHealthConditionService(apiClient);
    });
