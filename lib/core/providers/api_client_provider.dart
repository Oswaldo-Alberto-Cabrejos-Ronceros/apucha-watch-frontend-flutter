import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient("https://apucha-watch-backend-1094750444303.us-west1.run.app");
});
