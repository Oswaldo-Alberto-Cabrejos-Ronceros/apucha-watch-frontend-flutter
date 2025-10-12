import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/infrastructure/senior_citizen_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seniorCitizenProfileServiceProvide =
    Provider<SeniorCitizenProfileService>((ref) {
      final apiClient = ref.read(apiClientProvider);
      return SeniorCitizenProfileService(apiClient);
    });
