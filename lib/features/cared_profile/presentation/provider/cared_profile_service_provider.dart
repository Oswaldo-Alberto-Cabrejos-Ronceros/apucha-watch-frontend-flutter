import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apucha_watch_movil/features/cared_profile/infrastructure/cared_profile_service.dart';

final caredProfileServiceProvider = Provider<CaredProfileService>((ref) {
  return CaredProfileService();
});
