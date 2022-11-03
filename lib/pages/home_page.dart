import 'package:flutter/material.dart';
import 'package:socket_example/models/message_model.dart';
import 'package:socket_example/service/message_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<MessageModel> messages = [];
  final _controller = TextEditingController();
  final messageService = MessageService();

  @override
  void initState() {
    super.initState();
    messageService.socket.on('send-message', (data) {
      final message = MessageModel.fromJson(data);
      setState(() {
        messages.add(message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Real time app"
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: messages[index].userId
                          == messageService.socket.id ? MainAxisAlignment.end :
                          MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              messages[index].name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                messages[index].message,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.black)
                )
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type your message...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      messageService.sendMessage(
                        message: _controller.text,
                        name: widget.name,
                      );
                      _controller.clear();
                    },
                    icon: const Icon(Icons.send),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
