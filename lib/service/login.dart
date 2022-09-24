
import 'package:flutter/material.dart';
import 'package:socket_example/service/socket_io_service.dart';
import 'package:socket_example/utils/get_it.dart';


class LoginService {

  final socket = getIt.get<SocketService>().socket;

  void login({
    required String name,
  }) {
    socket.emit('login', {
      "name": name,
      "id": socket.id,
    });
  }

  void listenToLogin(VoidCallback navigate) {
    socket.on('login_success', (_) {
      navigate();
    });
  }


}