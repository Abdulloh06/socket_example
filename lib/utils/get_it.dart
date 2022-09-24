
import 'package:get_it/get_it.dart';
import 'package:socket_example/service/login.dart';
import 'package:socket_example/service/message_service.dart';
import 'package:socket_example/service/socket_io_service.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<SocketService>(() => SocketService());
  getIt.registerLazySingleton<LoginService>(() => LoginService());
  getIt.registerLazySingleton<MessageService>(() => MessageService());
}