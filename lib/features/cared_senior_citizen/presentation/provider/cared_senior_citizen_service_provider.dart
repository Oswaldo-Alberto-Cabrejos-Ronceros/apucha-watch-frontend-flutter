import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/infrastructure/cared_senior_citizen_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final caredSeniroCitizenServiceProvider = Provider<CaredSeniorCitizenService>((
  ref,
) {
  final apiClient = ref.read(apiClientProvider);
  return CaredSeniorCitizenService(apiClient);
});
