import 'package:flutter/material.dart';
import 'package:socket_example/pages/home_page.dart';
import 'package:socket_example/utils/get_it.dart';

import '../service/login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final socket = getIt.get<LoginService>();

  @override
  void initState() {
    socket.listenToLogin(() {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(
        name: _nameController.text,
      )));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 250),
                  const Text(
                    "Welcome\nType your name to continue",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    validator: (v) => v!.isEmpty
                        ? "You must fill this line"
                        : v.length < 3
                        ? "At least 3 characters"
                        : null,
                    controller: _nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          socket.login(name: _nameController.text);
                        }
                      },
                      child: const Text(
                        "Enter",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
