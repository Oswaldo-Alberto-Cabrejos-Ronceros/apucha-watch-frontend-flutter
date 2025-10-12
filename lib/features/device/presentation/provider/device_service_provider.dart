import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/device/infrastructure/device_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceServiceProvider = Provider<DeviceService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return DeviceService(apiClient);
});
