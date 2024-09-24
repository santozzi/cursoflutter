import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sergio Antozzi'),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.licdn.com/dms/image/D4E03AQGntr3WsXqllw/profile-displayphoto-shrink_400_400/0/1692307094486?e=2147483647&v=beta&t=7JPkvZDYeNBmvA0P45JHyFuh6eXOjux72ReDFpS4e4Q')),
          ),
          centerTitle: false,
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Text('Indice: $index');
            })),
            const Text('hola que tal')
          ],
        ),
      ),
    );
  }
}
