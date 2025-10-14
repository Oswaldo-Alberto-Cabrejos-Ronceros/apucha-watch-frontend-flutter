import 'package:apucha_watch_movil/core/api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient("http://localhost:3000");
});
