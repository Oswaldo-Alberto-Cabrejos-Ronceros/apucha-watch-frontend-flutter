import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/vital_sign_alert/infrastructure/vital_signs_alert_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vitalSignsAlertServiceProvider =
    Provider<VitalSignsAlertService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return VitalSignsAlertService(apiClient);
});