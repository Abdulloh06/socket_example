
import 'package:socket_example/service/socket_io_service.dart';
import 'package:socket_example/utils/get_it.dart';


class MessageService {

  final socket = getIt.get<SocketService>().socket;

  void sendMessage({
    required String message,
    required String name,
  }) {
    final data = {
      "message": message,
      "name": name,
      "user_id": socket.id,
    };
    socket.emit('send-message', data);
  }

}