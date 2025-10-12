import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apucha_watch_movil/features/cared_profile/infrastructure/cared_profile_service.dart';

final caredProfileServiceProvider = Provider<CaredProfileService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return CaredProfileService(apiClient);
});
