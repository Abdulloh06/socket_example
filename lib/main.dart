import 'package:flutter/material.dart';
import 'package:socket_example/pages/auth_page.dart';
import 'package:socket_example/utils/get_it.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Socket IO",
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
