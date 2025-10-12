import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/vitalsign/infrastructure/vital_sign_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vitalSignServiceProvider = Provider<VitalSignService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return VitalSignService(apiClient);
});
