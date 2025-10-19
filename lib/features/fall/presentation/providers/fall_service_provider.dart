import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/fall/infrastructure/fall_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fallServiceProvider = Provider<FallService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return FallService(apiClient);
});
