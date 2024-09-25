import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnomaybe/domain/entities/message.dart';
import 'package:yesnomaybe/main.dart';
import 'package:yesnomaybe/presentation/providers/chat_provider.dart';
import 'package:yesnomaybe/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yesnomaybe/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesnomaybe/presentation/widgets/shared/message_field_box.dart';

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
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.mine)
                    ? MyMessageBubble(message: message.text)
                    : HerMessageBubble(message: message.text);
              },
            )),
            MessageFieldBox(onValue: chatProvider.sendMessage),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
