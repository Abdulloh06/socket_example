import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';


class SocketService {

  final socket = io(
      'http://10.0.2.2:3000/',
      OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build());

  void initialize() {
    try {
      socket.connect();
      socket.onConnect((data) => debugPrint(data));
      socket.onDisconnect((_) => debugPrint('disconnect'));
    } catch (e) {
      debugPrint("Something went wrong");
      debugPrint(e.toString());
    }
  }


}
