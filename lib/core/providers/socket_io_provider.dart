import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apucha_watch_movil/core/socket_io_client/socket_io_client.dart';

final socketClientProvider = Provider<SocketIOClient>((ref) {
  final socketClient = SocketIOClient();
  socketClient.connect('http://localhost:3000');
  ref.onDispose(() {
    socketClient.dispose();
  });
  return socketClient;
});
