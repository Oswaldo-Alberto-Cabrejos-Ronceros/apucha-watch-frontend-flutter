import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/auth/infrastructure/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthService(apiClient);
});
