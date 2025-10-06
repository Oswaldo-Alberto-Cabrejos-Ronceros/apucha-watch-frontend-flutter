import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIOClient {
  late io.Socket socket;
  final _messagesController = StreamController<dynamic>.broadcast();
  Stream<dynamic> get messages => _messagesController.stream;

  void connect(String url, {String? token}) {
    //para evitar multiples conexiones
    if (socket.connected) {
      return;
    }

    socket = io.io(
      url,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setAuth({'token': token})
          .enableReconnection()
          .setReconnectionAttempts(5)
          .setReconnectionDelay(2000)
          .build(),
    );
    //conect
    socket.connect();
    //lister conection
    socket.onConnect((_) {
      // ignore: avoid_print
      print('Conectado al servidor de Socket.IO');
    });
    //listen desconection
    socket.onDisconnect((_) {
      // ignore: avoid_print
      print('Desconectado del servidor de Socket.IO');
    });
    //listen messages
    socket.on('messague', (data) {
      //emit message to stream
      _messagesController.add(data);
    });
    //listen error
    // ignore: avoid_print
    socket.onError((err) => print('Error en Socket.IO: $err'));
    //listen connectError
    // ignore: avoid_print
    socket.onConnectError(
      (err) => print('Error de conexion en Socket.IO: $err'),
    );
  }

  //for send message
  void emit(String event, dynamic data) {
    socket.emit(event, data);
  }

  //for listen event
  void on(String event, Function(dynamic) callback) {
    socket.on(event, callback);
  }

  //for get if is connected
  bool isConnected() {
    return socket.connected;
  }

  //for disconnect
  void disconnect() {
    socket.disconnect();
    //closes the stream controller
    _messagesController.close();
  }

  //for dispose
  void dispose() {
    socket.dispose();
    _messagesController.close();
  }
}
