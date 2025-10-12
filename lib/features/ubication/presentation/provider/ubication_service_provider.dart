import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/ubication/infrastructure/ubication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ubicationServiceProvider = Provider<UbicationService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return UbicationService(apiClient);
});
